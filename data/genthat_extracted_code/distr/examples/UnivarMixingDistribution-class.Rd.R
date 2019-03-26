library(distr)


### Name: UnivarMixingDistribution-class
### Title: Class "UnivarMixingDistribution"
### Aliases: UnivarMixingDistribution-class mixCoeff mixDistr mixCoeff<-
###   mixDistr<- mixCoeff<--methods mixDistr<--methods
###   mixCoeff<-,UnivarMixingDistribution-method
###   mixDistr<-,UnivarMixingDistribution-method mixCoeff-methods
###   mixDistr-methods mixCoeff,UnivarMixingDistribution-method
###   mixDistr,UnivarMixingDistribution-method
###   support,UnivarMixingDistribution-method
###   gaps,UnivarMixingDistribution-method
###   .logExact,UnivarMixingDistribution-method
###   .lowerExact,UnivarMixingDistribution-method
###   Symmetry,UnivarMixingDistribution-method
### Keywords: distribution

### ** Examples

mylist <- UnivarMixingDistribution(Binom(3,.3), Dirac(2), Norm(), 
          mixCoeff=c(1/4,1/5,11/20))
mylist2 <- UnivarMixingDistribution(Binom(3,.3), mylist, 
          mixCoeff=c(.3,.7))
mylist2
p(mylist)(0.3)          
mixDistr(mylist2)



