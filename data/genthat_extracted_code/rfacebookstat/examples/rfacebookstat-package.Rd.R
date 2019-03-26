library(rfacebookstat)


### Name: rfacebookstat-package
### Title: Load Data from Facebook API Marketing
### Aliases: rfacebookstat-package rfacebookstat
### Keywords: package

### ** Examples

## Not run: 
##D library(rfacebookstat)
##D # Auth
##D token <- fbGetToken(app_id = 00000000000000)
##D 
##D # Get statistic
##D CampStat <- fbGetMarketingStat(accounts_id = "act_0000000000",
##D level = "campaign", fields = "campaign_name,impressions,clicks",
##D breakdowns = "age", sorting = "unique_impressions_descending",
##D filtering = "[{'field':'age','operator':'IN','value':['18-24','25-34']}]",
##D date_start = "2016-10-01", date_stop = "2016-10-10",
##D access_token = token)
## End(Not run)



