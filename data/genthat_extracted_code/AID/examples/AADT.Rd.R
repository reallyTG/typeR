library(AID)


### Name: AADT
### Title: Average Annual Daily Traffic Data
### Aliases: AADT
### Keywords: datasets

### ** Examples


library(AID)

data(AADT)
attach(AADT)
hist(aadt)
out <- boxcoxfr(aadt, class)
confInt(out)



