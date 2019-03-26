library(plink)


### Name: as.irt.pars
### Title: irt.pars objects
### Aliases: as.irt.pars as.irt.pars-methods
###   as.irt.pars,numeric,missing-method
###   as.irt.pars,data.frame,missing-method
###   as.irt.pars,matrix,missing-method as.irt.pars,list,missing-method
###   as.irt.pars,sep.pars,missing-method as.irt.pars,list,matrix-method
###   as.irt.pars,list,list-method
### Keywords: utilities

### ** Examples

# Create object for three dichotomous (1PL) items with difficulties 
# equal to -1, 0, 1
x <- as.irt.pars(c(-1,0,1))


# Create object for three dichotomous (3PL) items and two polytomous 
# (gpcm) items without a location parameter 
# (use signature matrix, missing)
dichot <- matrix(c(1.2, .8, .9, 2.3, -1.1, -.2, .24, .19, .13),3,3)
poly <- matrix(c(.64, -1.8, -.73, .45, NA, .88, .06, 1.4, 1.9, 2.6),
  2,5,byrow=TRUE)
pars <- rbind(cbind(dichot,matrix(NA,3,2)),poly)
cat <- c(2,2,2,4,5)
pm <- as.poly.mod(5, c("drm","gpcm"), list(1:3,4:5))
x <- as.irt.pars(pars, cat=cat, poly.mod=pm)
summary(x)


# Create object for three dichotomous (3PL) items and two polytomous 
# (gpcm) items without a location parameter 
# (use signature list, missing)
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
x <- as.irt.pars(pars, cat=cat, poly.mod=pm)
summary(x)


# Create object for three dichotomous (3PL) items, four polytomous items,
# two gpcm items and two nrm items. Include a location parameter for the 
# gpcm items (use signature list, missing)
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
x <- as.irt.pars(pars, cat=cat, poly.mod=pm, location=TRUE)
summary(x, TRUE)


# Create object with two groups (all dichotomous items)
pm <- as.poly.mod(36)
x <- as.irt.pars(KB04$pars, KB04$common, cat=list(rep(2,36),rep(2,36)), 
  list(pm,pm), grp.names=c("form.x","form.y"))
summary(x, TRUE)


# Create object with six groups (all dichotomous items)
pars <- TK07$pars
common <- TK07$common
cat <- list(rep(2,26),rep(2,34),rep(2,37),rep(2,40),rep(2,41),rep(2,43))
pm1 <- as.poly.mod(26)
pm2 <- as.poly.mod(34)
pm3 <- as.poly.mod(37)
pm4 <- as.poly.mod(40)
pm5 <- as.poly.mod(41)
pm6 <- as.poly.mod(43)
pm <- list(pm1, pm2, pm3, pm4, pm5, pm6)
x <- as.irt.pars(pars, common, cat, pm, 
  grp.names=paste("grade",3:8,sep=""))

# Create an object with two groups using mixed-format items and 
# a mixed placement of common items. This example uses the dgn dataset.
pm1=as.poly.mod(55,c("drm","gpcm","nrm"),dgn$items$group1)
pm2=as.poly.mod(55,c("drm","gpcm","nrm"),dgn$items$group2)
x=as.irt.pars(dgn$pars,dgn$common,dgn$cat,list(pm1,pm2))
summary(x, TRUE)



