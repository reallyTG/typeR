library(eefAnalytics)


### Name: crtFREQ
### Title: Analysis of Cluster Randomised Education Trials using Multilevel
###   Model.
### Aliases: crtFREQ

### ** Examples

if(interactive()){

data(crtData)

########################################################
## MLM analysis of cluster randomised trials + 1.96SE ##
########################################################

output1 <- crtFREQ(Posttest~ Intervention+Prettest,random="School",
		intervention="Intervention",data=crtData)


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
## MLM analysis of cluster randomised trials ##	 
## with bootstrap confidence intervals       ##
###############################################

output2 <- crtFREQ(Posttest~ Intervention+Prettest,random="School",
		intervention="Intervention",nBoot=1000,data=crtData)


### Effect size

ES2 <- output2$ES
ES2

### plot bootstrapped values

plot(output2, group=1)

#######################################################################
## MLM analysis of cluster randomised trials with permutation p-value##
#######################################################################

output3 <- crtFREQ(Posttest~ Intervention+Prettest,random="School",
		intervention="Intervention",nPerm=1000,data=crtData)

### Effect size

ES3 <- output3$ES
ES3


### plot permutated values

plot(output3, group=1)
}



