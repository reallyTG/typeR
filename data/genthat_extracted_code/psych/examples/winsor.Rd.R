library(psych)


### Name: winsor
### Title: Find the Winsorized scores, means, sds or variances for a
###   vector, matrix, or data.frame
### Aliases: winsor winsor.mean winsor.means winsor.sd winsor.var
### Keywords: univar

### ** Examples

data(sat.act)
winsor.means(sat.act) #compare with the means of the winsorized scores
y <- winsor(sat.act)
describe(y)
xy <- data.frame(sat.act,y)
#pairs.panels(xy) #to see the effect of winsorizing 
x <- matrix(1:100,ncol=5)
winsor(x)
winsor.means(x)
y <- 1:11
winsor(y,trim=.5)



