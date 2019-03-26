library(dplR)


### Name: tbrm
### Title: Calculate Tukey's Biweight Robust Mean
### Aliases: tbrm
### Keywords: robust univar

### ** Examples

library(stats)
library(utils)
foo <- rnorm(100)
tbrm(foo)
mean(foo)

## Compare
data(co021)
co021.rwi <- detrend(co021, method = "ModNegExp")
crn1 <- apply(co021.rwi, 1, tbrm)
crn2 <- chron(co021.rwi)
cor(crn1, crn2[, 1])



