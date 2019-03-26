library(eefAnalytics)


### Name: srtFREQ
### Title: Analysis of Simple Randomised Education Trial using Linear
###   Regression Model.
### Aliases: srtFREQ

### ** Examples

if(interactive()){

data(mstData)

###################################################################
## Analysis of simple randomised trials using Hedges Effect Size ##
###################################################################

output1 <- srtFREQ(Posttest~ Intervention+Prettest,
		intervention="Intervention",data=mstData )
ES1 <- output1$ES
ES1

###################################################################
## Analysis of simple randomised trials using Hedges Effect Size ## 
## with Permutation p-value                                      ##
###################################################################

output2 <- srtFREQ(Posttest~ Intervention+Prettest,
		intervention="Intervention",nPerm=1000,data=mstData )

ES2 <- output2$ES
ES2


#### plot permutated values

plot(output2, group=1)



###################################################################
## Analysis of simple randomised trials using Hedges Effect Size ##
## with non-parametric bootstrap confidence intervals            ##
###################################################################

output3 <- srtFREQ(Posttest~ Intervention+Prettest,
		intervention="Intervention",nBoot=1000,data=mstData)

ES3 <- output3$ES
ES3

### plot bootstrapped values

plot(output3, group=1)

####################################################################
## Analysis of simple randomised trials using Hedges' effect size  ##
##  with schools as fixed effects                                  ##
####################################################################

output4 <- srtFREQ(Posttest~ Intervention+Prettest+as.factor(School),
		intervention="Intervention",data=mstData )

ES4 <- output4$ES
ES4

####################################################################
## Analysis of simple randomised trials using Hedges' effect size ##
## with schools as fixed effects and with permutation p-value     ##
####################################################################

output5 <- srtFREQ(Posttest~ Intervention+Prettest+as.factor(School),
		intervention="Intervention",nPerm=1000,data=mstData )

ES5 <- output5$ES
ES5

#### plot permutated values

plot(output5, group=1)

####################################################################
## Analysis of simple randomised trials using Hedges' effect size ##
## with schools as fixed effects and with permutation p-value      ##
####################################################################

output6 <- srtFREQ(Posttest~ Intervention+Prettest+as.factor(School),
		intervention="Intervention",nBoot=1000,data=mstData)

ES6 <- output6$ES
ES6 

### plot bootstrapped values

plot(output6, group=1)
}



