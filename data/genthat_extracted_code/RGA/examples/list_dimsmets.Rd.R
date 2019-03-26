library(RGA)


### Name: list_dimsmets
### Title: Lists all the dimensions and metrics for a particular report
###   type
### Aliases: list_dimsmets

### ** Examples

## Not run: 
##D ga_meta <- list_dimsmets("ga")
##D # a count of parameters types
##D table(ga_meta$type)
##D # parameters groups
##D table(ga_meta$group)
##D # get a deprecated parameters was replaced by
##D subset(ga_meta, status == "DEPRECATED", c(id, replacedBy))
##D # get a calculation metrics
##D subset(ga_meta, !is.na(calculation), c(id, calculation))
##D # get a not deprecated metrics from user group
##D subset(ga_meta, group == "User" & type == "METRIC" & status != "DEPRECATED", id)
##D # get parameters allowed in segments
##D subset(ga_meta, allowedInSegments, id)
## End(Not run)




