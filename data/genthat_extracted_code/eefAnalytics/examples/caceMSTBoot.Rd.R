library(eefAnalytics)


### Name: caceMSTBoot
### Title: CACE Analysis of Multisite Randomised Education Trials.
### Aliases: caceMSTBoot

### ** Examples

if(interactive()){

data(mstData)

########################################################
## MLM analysis of multisite trials + 1.96SE ##
########################################################

output1 <- mstFREQ(Posttest~ Intervention+Prettest,random="School",
		intervention="Intervention",data=mstData)


### Fixed effects
beta <- output1$Beta
beta

### Effect size
ES1 <- output1$ES
ES1

## Covariance matrix
covParm <- output1$covParm
covParm

### plot random effects for schools

plot(output1)

###############################################
## MLM analysis of multisite trials          ##	 
## with bootstrap confidence intervals       ##
###############################################

output2 <- mstFREQ(Posttest~ Intervention+Prettest,random="School",
		intervention="Intervention",nBoot=1000,data=mstData)

tp <- output2$Bootstrap
### Effect size

ES2 <- output2$ES
ES2

### plot bootstrapped values 

plot(output2, group=1)

#######################################################################
## MLM analysis of mutltisite trials with permutation p-value##
#######################################################################

output3 <- mstFREQ(Posttest~ Intervention+Prettest,random="School",
		intervention="Intervention",nPerm=1000,data=mstData)

ES3 <- output3$ES
ES3

#### plot permutated values 

plot(output3, group=1)
}



