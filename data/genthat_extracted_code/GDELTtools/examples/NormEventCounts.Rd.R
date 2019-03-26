library(GDELTtools)


### Name: NormEventCounts
### Title: Scale event counts
### Aliases: NormEventCounts

### ** Examples

## Not run: 
##D GDELT.subset.data <- GetGDELT("2013-06-01", "2013-06-07", allow.wildcards=TRUE,
##D   filter=list(ActionGeo_CountryCode=c("AF", "US"), EventCode="14*"),
##D   local.folder="~/gdeltdata")
##D GDELT.normed.data <- NormEventCounts(x = GDELT.subset.data,
##D   unit.analysis="day",
##D   var.name="protest")
## End(Not run)



