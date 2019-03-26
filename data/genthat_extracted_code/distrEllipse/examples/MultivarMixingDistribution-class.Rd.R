library(distrEllipse)


### Name: MultivarMixingDistribution-class
### Title: Class "MultivarMixingDistribution"
### Aliases: MultivarMixingDistribution-class mixCoeff mixDistr mixCoeff<-
###   mixDistr<- mixCoeff<--methods mixDistr<--methods
###   mixCoeff<-,MultivarMixingDistribution-method
###   mixDistr<-,MultivarMixingDistribution-method mixCoeff-methods
###   mixDistr-methods mixCoeff,MultivarMixingDistribution-method
###   mixDistr,MultivarMixingDistribution-method
###   support,MultivarMixingDistribution-method
###   gaps,MultivarMixingDistribution-method
###   .logExact,MultivarMixingDistribution-method
###   .lowerExact,MultivarMixingDistribution-method
###   Symmetry,MultivarMixingDistribution-method
###   dimension,MultivarMixingDistribution-method
###   dim,MultivarMixingDistribution-method
###   E,MultivarMixingDistribution,missing,missing-method
###   E,MultivarMixingDistribution,function,missing-method
###   var,MultivarMixingDistribution-method
###   show,MultivarMixingDistribution-method
###   showobj,MultivarMixingDistribution-method
### Keywords: distribution

### ** Examples

mylist <- MultivarMixingDistribution(Binom(3,.3), Dirac(2), Norm(), 
          mixCoeff=c(1/4,1/5,11/20))
mylist2 <- MultivarMixingDistribution(Binom(3,.3), mylist, 
          mixCoeff=c(.3,.7))
mylist2
p(mylist)(0.3)          
mixDistr(mylist2)
E(mylist)
var(mylist)

##multivariate
E1 <- diag(1,2)%*%EllipticalDistribution(radDistr=Gammad())+c(1,2)
mylistD <- MultivarMixingDistribution(MVNorm(), E1, MVt(),
          mixCoeff=c(1/4,1/5,11/20))
mylistD2 <- MultivarMixingDistribution(E1+c(-2,2), mylistD,
          mixCoeff=c(.3,.7))
mylistD2
p(mylistD)
mixDistr(mylistD2)
E(mylistD2)
var(mylistD2)



