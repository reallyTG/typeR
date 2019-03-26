library(emplik)


### Name: emplikHs.test2
### Title: Two sample empirical likelihood ratio test for hazards with
###   right censored, left truncated data. Many constraints.
### Aliases: emplikHs.test2
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
fun2 <- function(x){ cbind(as.numeric(x <= 960), as.numeric(x <= 860))}
############ fun2 has matrix output ###############
emplikHs.test2(x1=xfemale, d1=dfemale, y1=yfemale, 
 x2=xmale, d2=dmale, y2=ymale, theta=c(0,0), fun1=fun2, fun2=fun2)
}
#############################################
###################### Second example:
if(require("KMsurv", quietly = TRUE)) {
####library(KMsurv)
data(kidney)
### these functions counts the risk set size, so delta=1 always ###
temp1 <- Wdataclean3(z=kidney$time[kidney[,3]==1], d=rep(1,43) )
temp2 <- DnR(x=temp1$value, d=temp1$dd, w=temp1$weight)
TIME <- temp2$times
RISK <- temp2$n.risk
fR1 <- approxfun(x=TIME, y=RISK, method="constant", yright=0, rule=2, f=1)
temp1 <- Wdataclean3(z=kidney$time[kidney[,3]==2], d=rep(1,76) )
temp2 <- DnR(x=temp1$value, d=temp1$dd, w=temp1$weight)
TIME <- temp2$times
RISK <- temp2$n.risk
fR2 <- approxfun(x=TIME, y=RISK, method="constant", yright=0, rule=2, f=1)

### the weight function for two sample Gehan-Wilcoxon type test ###
fun <- function(t){ fR1(t)*fR2(t)/((76*43)*sqrt(119/(76*43)) )}
### Here comes the test: ###
emplikHs.test2(x1=kidney[kidney[,3]==1,1],d1=kidney[kidney[,3]==1,2],
   x2=kidney[kidney[,3]==2,1],d2=kidney[kidney[,3]==2,2],
   theta=0, fun1= fun, fun2=fun)
### The results should include this ###
#$"-2LLR"
#[1] 0.002473070
#
#$lambda
#[1] -0.1713749
#######################################
######### the weight function for log-rank test #####
funlogrank <- function(t){sqrt(119/(76*43))*fR1(t)*fR2(t)/(fR1(t)+fR2(t))}
##### Now the log-rank test ###
emplikHs.test2(x1=kidney[kidney[,3]==1,1],d1=kidney[kidney[,3]==1,2],
  x2=kidney[kidney[,3]==2,1],d2=kidney[kidney[,3]==2,2],
  theta=0, fun1=funlogrank, fun2=funlogrank)
##### The result of log rank test should include this ###
#
#$"-2LLR"
#[1] 2.655808
#
#$lambda
#[1] 3.568833
#######################################################
###### the weight function for both type test ####
funBOTH <- function(t) {
       cbind(sqrt(119/(76*43))*fR1(t)*fR2(t)/(fR1(t)+fR2(t)), 
                 fR1(t)*fR2(t)/((76*43)*sqrt(119/(76*43)))) }
#### The test that combine both tests ###
emplikHs.test2(x1=kidney[kidney$type==1,1],d1=kidney[kidney$type==1,2],
    x2=kidney[kidney$type==2,1],d2=kidney[kidney$type==2,2],
    theta=c(0,0), fun1=funBOTH, fun2=funBOTH)
#### the result should include this ###
#
#$"-2LLR"
#[1] 13.25476
#
#$lambda
#[1]  14.80228 -21.86733
##########################################
}



