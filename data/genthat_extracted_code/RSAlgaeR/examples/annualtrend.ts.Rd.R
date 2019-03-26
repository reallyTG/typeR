library(RSAlgaeR)


### Name: annualtrend.ts
### Title: Explore long term annual trends with Theil-Sen Estimator
### Aliases: annualtrend.ts

### ** Examples

data(estimatedrecord)
annualtrend.ts(record=estimatedrecord,valuecol="EstChlValue",
datecol="ImageDate",var="mean",monthlybias="TRUE")



