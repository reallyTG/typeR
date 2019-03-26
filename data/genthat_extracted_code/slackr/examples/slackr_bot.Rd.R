library(slackr)


### Name: slackr_bot
### Title: Send result of R expressions to a Slack channel via webhook API
### Aliases: slackrBot slackr_bot

### ** Examples

## Not run: 
##D slackr_setup()
##D slackr_bot("iris info", head(iris), str(iris))
##D 
##D # or directly
##D slackr_bot("Test message", username="slackr", channel="#random",
##D   incoming_webhook_url="https://hooks.slack.com/services/XXXXX/XXXXX/XXXXX")
## End(Not run)



