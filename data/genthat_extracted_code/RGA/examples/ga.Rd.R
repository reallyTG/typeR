library(RGA)


### Name: ga
### Title: Lists all columns for a Google Analytics core report type
### Aliases: ga
### Keywords: data datasets

### ** Examples

# a count of parameters types
table(ga$type)
# parameters groups
table(ga$group)
# get a deprecated parameters was replaced by
subset(ga, status == "DEPRECATED", c(id, replacedBy))
# get a calculation metrics
subset(ga, !is.na(calculation), c(id, calculation))
# get a not deprecated metrics from user group
subset(ga, group == "User" & type == "METRIC" & status != "DEPRECATED", id)
# get parameters allowed in segments
subset(ga, allowedInSegments, id)



