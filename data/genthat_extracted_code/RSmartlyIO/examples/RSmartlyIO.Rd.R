library(RSmartlyIO)


### Name: RSmartlyIO
### Title: Loading Facebook and Instagram Advertising Data from Smartly.io
### Aliases: RSmartlyIO
### Keywords: ~Facebook ~Instagram ~Smartly.io

### ** Examples

## Not run: 
##D data <- getSmartlyData(start = "2016-03-01",
##D                        end = "2016-03-02",
##D                        date = "date",
##D                        accountID="*****************",
##D                        accountInfo = F,
##D                        campaignStructure = c("campaign_name", "campaign_fb_id"),
##D                        billing = c("bid.optimization_goal", "bid.billing_event"),
##D                        targeting = c("targeting.geo_locations.countries"),
##D                        creative = c("creative_meta.call_to_action"),
##D                        #facebook = "age",
##D                        apiToken="************************************",
##D                        metrics = c("impressions","clicks"))
## End(Not run)



