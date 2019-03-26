library(pointblank)


### Name: set_slack_prefs
### Title: Set Slack credentials and enable Slack notifications
### Aliases: set_slack_prefs

### ** Examples

## Not run: 
##D # Create a simple data frame
##D # with a column of numerical values
##D df <-
##D   data.frame(
##D     a = c(5, 7, 6, 5, 8, 7))
##D 
##D # Create a pointblank `agent`,
##D # set up the Slack notification
##D # preferences, and conduct a
##D # simple validation; because
##D # `notify_count` (in the step
##D # where `col_vals_lt()` is called)
##D # has a value of `1` the
##D # `slack_channel` will be
##D # notified when there are one or
##D # more non-passing validations (in
##D # this case, non-passing rows)
##D agent <-
##D   create_agent() %>%
##D   set_slack_prefs(
##D     notify_active = TRUE,
##D     slack_webhook_url = 
##D       "https://hooks.slack.com/services/XXXXX/XXXXX/XXXXX",
##D     slack_channel = 
##D       "#table-validation",
##D     slack_username = "table_validator",
##D     slack_report_url = 
##D       "https:://my.company.com/reports/df_validation") %>%
##D   focus_on(tbl_name = "df") %>%
##D   col_vals_lt(
##D     column = a,
##D     value = 6,
##D     notify_count = 1) %>%
##D   interrogate()
## End(Not run)



