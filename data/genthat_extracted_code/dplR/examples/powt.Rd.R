library(dplR)


### Name: powt
### Title: Power Transformation of Tree-Ring Data
### Aliases: powt
### Keywords: manip

### ** Examples
library(utils)
data(gp.rwl)
gp.pt <- powt(gp.rwl)
hist(summary(gp.rwl)$skew)
hist(summary(gp.pt)$skew)



