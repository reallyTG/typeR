library(spsurvey)


### Name: attrisk.est
### Title: Compute the Attributable Risk Estimate
### Aliases: attrisk.est
### Keywords: survey survival

### ** Examples

response <- sample(c("Poor", "Good"), 100, replace=TRUE)
stressor <- sample(c("Poor", "Good"), 100, replace=TRUE)
wgt <- runif(100, 10, 100)
attrisk.est(response, stressor, wgt=wgt, vartype="SRS")

xcoord <- runif(100)
ycoord <- runif(100)
attrisk.est(response, stressor, wgt=wgt, xcoord=xcoord, ycoord=ycoord)



