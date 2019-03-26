library(intRvals)


### Name: partition
### Title: Estimate within-group variation
### Aliases: partition

### ** Examples

# select the group of intervals observed on Terschelling island
dropset=goosedrop[goosedrop$site=="terschelling",]
# estimate an interval model, with separate within- and between-group variation:
dr=estinterval(data=dropset$interval,group = dropset$bout_id)
# plot the model fit:
plot(dr)
# estimate within-group variation, and its significance:
output=partition(dr)
# print within-group standard deviation:
output$sigma.within
# is the model including within-group standard deviation signicant,
# relative to a null model without separate within-group sd,
# at the specified confidence level alpha?
output$`p<alpha`  #> TRUE



