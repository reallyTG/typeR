library(psych)


### Name: lowerUpper
### Title: Combine two square matrices to have a lower off diagonal for
###   one, upper off diagonal for the other
### Aliases: lowerUpper
### Keywords: multivariate

### ** Examples

 b1 <- Bechtoldt.1
 b2 <- Bechtoldt.2
 b12 <- lowerUpper(b1,b2)
 cor.plot(b12)
 diff12 <- lowerUpper(b1,b2,diff=TRUE)

 corPlot(t(diff12),numbers=TRUE,main="Bechtoldt1 and the differences from Bechtoldt2")
 
 #Compare r and partial r
 lower <- lowerCor(sat.act)
 upper <- partial.r(sat.act)
 both = lowerUpper(lower,upper)
 corPlot(both,numbers=TRUE,main="r and partial r for the sat.act data set")
#now show the differences
 both = lowerUpper(lower,upper,diff=TRUE)
 corPlot(both,numbers=TRUE,main="Differences between r and partial r for the sat.act data set")



