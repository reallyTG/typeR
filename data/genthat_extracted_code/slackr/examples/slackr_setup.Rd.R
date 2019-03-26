library(slackr)


### Name: slackr_setup
### Title: Setup environment variables for Slack API access
### Aliases: slackrSetup slackr_setup

### ** Examples

## Not run: 
##D # reads from default file (i.e. ~/.slackr)
##D slackr_setup()
##D 
##D # reads from alternate config
##D slackr_setup(config_file="/path/to/my/slackrconfig)
##D 
##D # the hard way
##D slackr_setup(channel="#code",
##D             incoming_webhook_url="https://hooks.slack.com/services/XXXXX/XXXXX/XXXXX")
## End(Not run)



