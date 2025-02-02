#  Copyright 2021 Practically.io All rights reserved
#
#  Use of this source is governed by a BSD-style
#  licence that can be found in the LICENCE file or at
#  https://www.practically.io/copyright/

Feature: Query::class;
  In order to test my plugin
  As a plugin developer
  I need to have tests

  Background:
    Given I have the following config
      """
      <?xml version="1.0"?>
      <psalm errorLevel="1">
        <projectFiles>
          <directory name="."/>
        </projectFiles>
        <plugins>
          <pluginClass class="Practically\PsalmPluginYii2\Plugin" />
        </plugins>
      </psalm>
      """
  And I have the following code preamble
      """
      <?php
      declare(strict_types=1);

      namespace Practically\PsalmPluginYii2\Tests\Sandbox;

	  use yii\db\ActiveQuery;
      """
  Scenario: You can create a instance of a model and its typed
    Given I have the following code
      """
        /**
         * @template TModel
         * @template TMultiple
         * @extends ActiveQuery<TModel, TMultiple>
         */
        class MyQuery extends ActiveQuery
        {
			public function active(): self
			{
				return $this;
			}
    	}
      """
    When I run Psalm
    Then I see no errors
