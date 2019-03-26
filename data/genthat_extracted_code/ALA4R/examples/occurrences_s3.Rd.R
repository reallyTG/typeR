library(ALA4R)


### Name: occurrences_s3
### Title: Summarize, filter and subset occurrence data
### Aliases: occurrences_s3 summary.occurrences unique.occurrences
###   subset.occurrences

### ** Examples

## Not run: 
##D #download some observations
##D x <- occurrences(taxon="Amblyornis newtonianus",download_reason_id=10)
##D 
##D #summarize the occurrences
##D summary(x)
##D 
##D #keep spatially unique data at 0.01 degrees (latitude and longitude)
##D tt <- unique(x,spatial=0.01)
##D summary(tt)
##D 
##D #keep spatially unique data that is also unique year/month for the collection date
##D tt <- unique(x,spatial=0,temporal='yearmonth')
##D summary(tt)
##D 
##D #keep only information for which fatal or "error" assertions do not exist
##D tt <- subset(x)
##D summary(tt)
## End(Not run)



