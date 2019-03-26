library(gsloid)


### Name: LR04_MISboundaries
### Title: Marine isotope stages (MIS) boundaries.
### Aliases: LR04_MISboundaries
### Keywords: datasets

### ** Examples

names(LR04_MISboundaries)
head(LR04_MISboundaries)
# subset the MIS data for the last 250 ka years
mis_last_250ka <- LR04_MISboundaries[LR04_MISboundaries$LR04_Age_ka_start <= 250, ]



