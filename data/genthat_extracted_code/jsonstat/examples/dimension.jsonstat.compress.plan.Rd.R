library(jsonstat)


### Name: dimension.jsonstat.compress.plan
### Title: dimension
### Aliases: dimension.jsonstat.compress.plan

### ** Examples

library(jsonstat)

.plan <- compress_plan("place.of.birth", "geo", "Place of Birth")
.plan <- dimension(.plan, "age.group", "classification", "Age Group")



