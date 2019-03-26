library(plink)


### Name: sep.pars-methods
### Title: Separate Item Parameters
### Aliases: sep.pars sep.pars-methods sep.pars,numeric-method
###   sep.pars,data.frame-method sep.pars,irt.pars-method
###   sep.pars,matrix-method sep.pars,list-method
### Keywords: methods

### ** Examples

###### Unidimensional Examples ######
# Create object for three dichotomous (1PL) items with difficulties -1, 0, 1
x <- sep.pars(c(-1,0,1))


# Create object for three dichotomous (3PL) items and two polytomous 
# (gpcm) items without a location parameter (the parameters are 
# formatted as a matrix)
dichot <- matrix(c(1.2, .8, .9, 2.3, -1.1, -.2, .24, .19, .13),3,3)
poly <- matrix(c(.64, -1.8, -.73, .45, NA, .88, .06, 1.4, 1.9, 2.6),
  2,5,byrow=TRUE)
pars <- rbind(cbind(dichot,matrix(NA,3,2)),poly)
cat <- c(2,2,2,4,5)
pm <- as.poly.mod(5, c("drm","gpcm"), list(1:3,4:5))
x <- sep.pars(pars, cat, pm)
summary(x)


# Create object for three dichotomous (3PL) items and two polytomous 
# (gpcm) items without a location parameter (the parameters are 
# included in a list)
a <- c(1.2, .8, .9, .64, .88)
b <- matrix(c(
  2.3, rep(NA,3),
  -1.1, rep(NA,3),
  -.2, rep(NA,3),
  -1.8, -.73, .45, NA,
  .06, 1.4, 1.9, 2.6),5,4,byrow=TRUE)
c <- c(1.4, 1.9, 2.6, NA, NA)
pars <- list(a,b,c)
cat <- c(2,2,2,4,5)
pm <- as.poly.mod(5, c("drm","gpcm"), list(1:3,4:5))
x <- sep.pars(pars, cat, pm)
summary(x)


# Create object for three dichotomous (3PL) items, four polytomous 
# items, two gpcm items and two nrm items. Include a location parameter 
# for the gpcm items. Maintain the location parameter in the output.
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
x <- sep.pars(pars, cat, pm, location=TRUE, loc.out=TRUE)
summary(x, descrip=TRUE)


# Create irt.pars object with two groups then run sep.pars
pm <- as.poly.mod(36)
x <- as.irt.pars(KB04$pars, KB04$common, cat=list(rep(2,36),rep(2,36)), 
  list(pm,pm), grp.names=c("form.x","form.y"))
out <- sep.pars(x)
summary(out, descrip=TRUE)


###### Multidimensional Examples ######
# Create object for three dichotomous (M1PL) items for two dimensions 
# with parameters related to item difficulties of -1, 0, 1
x <- sep.pars(c(-1,0,1), dimensions=2)

# Create object for three dichotomous (M3PL) items and two polytomous 
# (MGPCM) items without a location parameter for four dimensions 
# (the parameters are included in a list)
a <- matrix(c(0.5038, 2.1910, 1.1317, 0.2493,
  2.9831, 0.4811, 0.3566, 0.4306,
  0.2397, 0.2663, 1.5588, 0.5295,
  0.2020, 0.2410, 1.2061, 0.5552,
  0.2054, 0.6302, 0.3152, 0.2037),5,4,byrow=TRUE)
b <- matrix(c(0.5240, rep(NA,3),
  -1.8841, rep(NA,3),
  0.2570, rep(NA,3),
  -1.4207, 0.3041, -0.5450, NA,
  -2.1720, 0.0954, 0.6531, 0.9114),5,4,byrow=TRUE)
c <- c(0.1022, 0.3528, 0.2498, NA, NA)
pars <- list(a,b,c)
cat <- c(2,2,2,4,5)
pm <- as.poly.mod(5, c("drm","gpcm"), list(1:3,4:5))
x <- sep.pars(pars, cat, pm, dimensions=4)
summary(x, descrip=TRUE)



