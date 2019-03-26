library(emplik)


### Name: emplikHs.disc2
### Title: Two sample empirical likelihood ratio for discrete hazards with
###   right censored, left truncated data. Many constraints.
### Aliases: emplikHs.disc2
### Keywords: nonparametric survival htest

### ** Examples

if(require("boot", quietly = TRUE)) {
####library(boot)
data(channing)
ymale <- channing[1:97,2]
dmale <- channing[1:97,5]
xmale <- channing[1:97,3]
yfemale <- channing[98:462,2]
dfemale <- channing[98:462,5]
xfemale <- channing[98:462,3]
fun1 <- function(x) { as.numeric(x <= 960) }
########################################################
emplikHs.disc2(x1=xfemale, d1=dfemale, y1=yfemale, 
 x2=xmale, d2=dmale, y2=ymale, theta=0.25, fun1=fun1, fun2=fun1)
########################################################
### This time you get "-2LLR" = 1.150098 etc. etc.
##############################################################
fun2 <- function(x){ cbind(as.numeric(x <= 960), as.numeric(x <= 860))}
############ fun2 has matrix output ###############
emplikHs.disc2(x1=xfemale, d1=dfemale, y1=yfemale, 
 x2=xmale, d2=dmale, y2=ymale, theta=c(0.25,0), fun1=fun2, fun2=fun2)
################# you get "-2LLR" = 1.554386, etc ###########
}



