library(fbRads)


### Name: fbad_read_ad
### Title: Read ad details
### Aliases: fbad_read_ad

### ** Examples

## Not run: 
##D ## get and Ad ID from yesterday
##D adid <- fb_insights(date_preset = 'yesterday', level = 'ad')[[1]]$ad_id[1]
##D ## look for current status of the Ad
##D fbad_read_ad(id = adid, fields = c('effective_status'))
## End(Not run)



