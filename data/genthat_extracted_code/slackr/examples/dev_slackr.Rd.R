library(slackr)


### Name: dev_slackr
### Title: Send the graphics contents of the current device to a Slack
###   channel
### Aliases: dev.slackr dev_slackr

### ** Examples

## Not run: 
##D slackr_setup()
##D 
##D # base
##D library(maps)
##D map("usa")
##D dev_slackr("#results", file='map')
##D 
##D # base
##D barplot(VADeaths)
##D dev_slackr("@jayjacobs")
## End(Not run)



