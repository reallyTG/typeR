library(psych)


### Name: fa.parallel
### Title: Scree plots of data or correlation matrix compared to random
###   "parallel" matrices
### Aliases: fa.parallel fa.parallel.poly plot.poly.parallel
### Keywords: multivariate

### ** Examples


#test.data <- Harman74.cor$cov   #The 24 variable Holzinger - Harman problem
#fa.parallel(test.data,n.obs=145)
fa.parallel(Thurstone,n.obs=213)   #the 9 variable Thurstone problem

#set.seed(123)
#minor <- sim.minor(24,4,400) #4 large and 12 minor factors
#ffa.parallel(minor$observed) #shows 5 factors and 4 components -- compare with 
#fa.parallel(minor$observed,SMC=FALSE) #which shows 6  and 4 components factors
#a demonstration of parallel analysis of a dichotomous variable
#fp <- fa.parallel(ability)    #use the default Pearson correlation
#fpt <- fa.parallel(ability,cor="tet")  #do a tetrachoric correlation
#fpt <- fa.parallel(ability,cor="tet",quant=.95)  #do a tetrachoric correlation and 
#use the 95th percentile of the simulated results
#apply(fp$values,2,function(x) quantile(x,.95))  #look at the 95th percentile of values
#apply(fpt$values,2,function(x) quantile(x,.95))  #look at the 95th percentile of values
#describe(fpt$values)  #look at all the statistics of the simulated values




