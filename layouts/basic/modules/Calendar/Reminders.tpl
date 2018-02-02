{*<!-- {[The file is published on the basis of YetiForce Public License 3.0 that can be found in the following directory: licenses/LicenseEN.txt or yetiforce.com]} -->*}
{strip}
	<div class="remindersContent">
		{foreach item=RECORD from=$RECORDS}
			{assign var=START_DATE value=$RECORD->get('date_start')}
			{assign var=START_TIME value=$RECORD->get('time_start')}
			{assign var=END_DATE value=$RECORD->get('due_date')}
			{assign var=END_TIME value=$RECORD->get('time_end')}
			{assign var=RECORD_ID value=$RECORD->getId()}
			<div class="panel picklistCBr_Calendar_activitytype_{\App\Purifier::encodeHtml($RECORD->get('activitytype'))}" data-record="{$RECORD_ID}">
				<div class="panel-heading picklistCBg_Calendar_activitytype_{\App\Purifier::encodeHtml($RECORD->get('activitytype'))}">
					 <button class="btn btn-success btn-sm float-right showModal" data-url="index.php?module=Calendar&view=ActivityStateModal&trigger=Reminders&record={$RECORD->getId()}">
						<span class="fas fa-check"></span>
					</button>
					<img class="activityTypeIcon" src="{\App\Layout::getImagePath($RECORD->getActivityTypeIcon())}" />&nbsp;
					<a target="_blank" href="index.php?module=Calendar&view=Detail&record={$RECORD_ID}">
						{$RECORD->getDisplayValue('subject')}
					</a>
				</div>
				<div class="panel-body">
					<div>
						{\App\Language::translate('Start Date & Time',$MODULE_NAME)}: <strong>{\App\Fields\DateTime::formatToDay("$START_DATE $START_TIME",$RECORD->get('allday'))}</strong>
					</div>
					<div>
						{\App\Language::translate('Due Date',$MODULE_NAME)}: <strong>{\App\Fields\DateTime::formatToDay("$END_DATE $END_TIME",$RECORD->get('allday'))}</strong>
					</div>
					{if $RECORD->get('activitystatus') neq '' }
						<div>
							{\App\Language::translate('Status',$MODULE_NAME)}: <strong>{$RECORD->getDisplayValue('activitystatus')}</strong>
						</div>
					{/if}
					{if $RECORD->get('link') neq ''}
						<div>
							{\App\Language::translate('FL_RELATION',$MODULE_NAME)}: <strong>{$RECORD->getDisplayValue('link')}</strong>
							{if $PERMISSION_TO_SENDE_MAIL}
								{if $USER_MODEL->get('internal_mailer') == 1}
									{assign var=COMPOSE_URL value=OSSMail_Module_Model::getComposeUrl(\App\Record::getType($RECORD->get('link')), $RECORD->get('link'), 'Detail', 'new')}
									<a target="_blank" class="float-right btn btn-light btn-sm actionIcon" href="{$COMPOSE_URL}" title="{\App\Language::translate('LBL_SEND_EMAIL')}">
										<span class="fas fa-envelope"></span>
									</a>
								{else}
									{assign var=URLDATA value=OSSMail_Module_Model::getExternalUrl(\App\Record::getType($RECORD->get('link')), $RECORD->get('link'), 'Detail', 'new')}
									{if $URLDATA && $URLDATA != 'mailto:?'}
										<a class="float-right btn btn-light btn-sm actionIcon" href="{$URLDATA}" title="{\App\Language::translate('LBL_CREATEMAIL', 'OSSMailView')}">
											<span class="fas fa-envelope" title="{\App\Language::translate('LBL_CREATEMAIL', 'OSSMailView')}"></span>
										</a>
									{/if}
								{/if}
							{/if}
						</div>
					{/if}
					{if $RECORD->get('process') neq '' }
						<div>
							{\App\Language::translate('FL_PROCESS',$MODULE_NAME)}: <strong>{$RECORD->getDisplayValue('process')}</strong>
						</div>
					{/if}
					{if $RECORD->get('linkextend') neq ''}
						<div>
							{\App\Language::translate('FL_RELATION_EXTEND',$MODULE_NAME)}: <strong>{$RECORD->getDisplayValue('linkextend')}</strong>
							{if $PERMISSION_TO_SENDE_MAIL}
								{if $USER_MODEL->get('internal_mailer') == 1}
									{assign var=COMPOSE_URL value=OSSMail_Module_Model::getComposeUrl(\App\Record::getType($RECORD->get('linkextend')), $RECORD->get('linkextend'), 'Detail', 'new')}
									<a target="_blank" class="float-right btn btn-light btn-sm actionIcon" href="{$COMPOSE_URL}" title="{\App\Language::translate('LBL_SEND_EMAIL')}">
										<span class="fas fa-envelope"></span>
									</a>
								{else}
									{assign var=URLDATA value=OSSMail_Module_Model::getExternalUrl(\App\Record::getType($RECORD->get('linkextend')), $RECORD->get('linkextend'), 'Detail', 'new')}
									{if $URLDATA && $URLDATA != 'mailto:?'}
										<a class="float-right btn btn-light btn-sm actionIcon" href="{$URLDATA}" title="{\App\Language::translate('LBL_CREATEMAIL', 'OSSMailView')}">
											<span class="fas fa-envelope" title="{\App\Language::translate('LBL_CREATEMAIL', 'OSSMailView')}"></span>
										</a>
									{/if}
								{/if}
							{/if}
						</div>
					{/if}
					{if $RECORD->get('subprocess') neq '' }
						<div>
							{\App\Language::translate('FL_SUB_PROCESS',$MODULE_NAME)}: <strong>{$RECORD->getDisplayValue('subprocess')}</strong>
						</div>
					{/if}
					{if $RECORD->get('location') neq '' }
						<div>
							{\App\Language::translate('Location',$MODULE_NAME)}:&nbsp;
							<strong>
								{$RECORD->getDisplayValue('location')}
							</strong>
							{if App\Privilege::isPermitted('OpenStreetMap')}
								<a class="float-right btn btn-light btn-sm actionIcon" data-location="{$RECORD->getDisplayValue('location')}" onclick="Vtiger_Index_Js.showLocation(this)">
									<span class="fas fa-map-marker-alt"></span>
								</a>
							{/if}
						</div>
					{/if}
					<hr />
					<div class="actionRow text-center">
						<a class="btn btn-light btn-sm btn-success showModal" data-url="index.php?module=Calendar&view=ActivityStateModal&trigger=Reminders&record={$RECORD->getId()}"><span class="fas fa-check"></span></a>
						<a class="btn btn-light btn-sm btn-primary reminderPostpone" data-time="15m">15{\App\Language::translate('LBL_M',$MODULE_NAME)}</a>
						<a class="btn btn-light btn-sm btn-primary reminderPostpone" data-time="30m">30{\App\Language::translate('LBL_M',$MODULE_NAME)}</a>
						<a class="btn btn-light btn-sm btn-primary reminderPostpone" data-time="1h">1{\App\Language::translate('LBL_H',$MODULE_NAME)}</a>
						<a class="btn btn-light btn-sm btn-primary reminderPostpone" data-time="2h">2{\App\Language::translate('LBL_H',$MODULE_NAME)}</a>
						<a class="btn btn-light btn-sm btn-primary reminderPostpone" data-time="6h">6{\App\Language::translate('LBL_H',$MODULE_NAME)}</a>
						<a class="btn btn-light btn-sm btn-primary reminderPostpone" data-time="1d">1{\App\Language::translate('LBL_D',$MODULE_NAME)}</a>
					</div>
				</div>
			</div>
		{foreachelse}
			<div class="alert alert-info">
				{\App\Language::translate('LBL_NO_CURRENT_ACTIVITIES',$MODULE_NAME)}
			</div>
		{/foreach}
	</div>
{/strip}
