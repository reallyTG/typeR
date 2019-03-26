library(plink)


### Name: mixed-methods
### Title: Mixed-Format Response Probabilities
### Aliases: mixed mixed-methods mixed,numeric,numeric-method
###   mixed,matrix,numeric-method mixed,data.frame,numeric-method
###   mixed,list,numeric-method mixed,irt.pars,ANY-method
###   mixed,sep.pars,ANY-method
### Keywords: methods distribution

### ** Examples

###### Unidimensional Examples ######
# Compute probabilities for three dichotomous (3PL) items and two 
# polytomous (gpcm) items without a location parameter
dichot <- matrix(c(1.2, .8, .9, 2.3, -1.1, -.2, .24, .19, .13),3,3)
poly <- matrix(c(.64, -1.8, -.73, .45, NA, .88, .06, 1.4, 1.9, 2.6),
  2,5,byrow=TRUE)
pars <- rbind(cbind(dichot,matrix(NA,3,2)),poly)
cat <- c(2,2,2,4,5)
pm <- as.poly.mod(5, c("drm","gpcm"), list(1:3,4:5))
x <- mixed(pars, cat, pm) 
plot(x)

# Specify a different scaling constant for the GPCM items in the
# above example
x <- mixed(pars, cat, pm, D.gpcm=1.7) 
plot(x)


# Compute probabilities for three dichotomous (3PL) items, four 
# polytomous items, two gpcm items and two nrm items. Include a 
# location parameter for the gpcm items
a <- matrix(c(
  1.2, rep(NA,4),
  .8, rep(NA,4),
  .9, rep(NA,4),
  .64, rep(NA,4),
  .88, rep(NA,4),
  .905, .522, -.469, -.959, NA, 
  .828, .375, -.357, -.079, -.817),7,5,byrow=TRUE)
b <- matrix(c(
  2.3, rep(NA,4),
  -1.1, rep(NA,4),
  -.2, rep(NA,4),
  -.69, -1.11, -.04, 1.14, NA,
  1.49, -1.43, -.09, .41, 1.11,
  .126, -.206, -.257, .336, NA, 
  .565, .865, -1.186, -1.199, .993),7,5,byrow=TRUE)
c <- c(.14, .19, .26, rep(NA,4))
pars <- list(a,b,c)
cat <- c(2,2,2,4,5,4,5)
pm <- as.poly.mod(7, c("drm","gpcm","nrm"), list(1:3,4:5,6:7))
x <- mixed(pars, cat, pm, location=TRUE)
plot(x)

###### Multidimensional Example ######
# Compute response probabilities for four dichotomous items
# modeled using the M2PL and three polytomous items modeled
# using the multidimensional graded response model. For the 
# later items, cumulative probabilities are computed.
a <- matrix(c(1.66,1.72,.69,.19,.88,1.12,.68,1.21,
     .873, .226, .516, .380, .613, .286 ),7,2,byrow=TRUE)
d <- matrix(c(-.38,NA,NA,NA,NA,
     -.68,NA,NA,NA,NA,
     -.91,NA,NA,NA,NA,
     -1.08,NA,NA,NA,NA,
     2.255, 1.334, -.503, -2.051, -3.082,
     1.917, 1.074, -.497, -1.521, -2.589,
     1.624, .994, -.656, -1.978, NA),7,5,byrow=TRUE)
cat <- c(2,2,2,2,6,6,5)
pars <- cbind(a,d)
pm <- as.poly.mod(7,c("drm","grm"),list(1:4,5:7))
x <- mixed(pars, cat, pm, dimensions=2, catprob=TRUE)
plot(x)



