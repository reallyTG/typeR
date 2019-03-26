library(distr)


### Name: qqplot
### Title: Methods for Function qqplot in Package 'distr'
### Aliases: qqplot qqplot-methods qqplot,ANY,ANY-method
###   qqplot,UnivariateDistribution,UnivariateDistribution-method
### Keywords: hplot distribution

### ** Examples

qqplot(Norm(15,sqrt(30)), Chisq(df=15))
## some discrete Distributions:
P <- Pois(5)
B <- Binom(size=2000,prob=5/2000)
qqplot(B,P)
## Not run: 
##D ## takes too much time for R CMD check --as-cran
##D qqplot(B,P, nosym.pCI=TRUE)
## End(Not run)
## some Lebesgue-Decomposed distributions:
mylist <- UnivarLebDecDistribution(discretePart=Binom(3,.3), acPart=Norm(2,2),
               acWeight=11/20)
mylist2 <- mylist+0.1
qqplot(mylist,mylist2)
qqplot(mylist,mylist2,exact.pCI=FALSE,exact.sCI=FALSE)
## Not run: 
##D ## takes too much time for R CMD check --as-cran
##D qqplot(mylist,mylist2,nosym.pCI=TRUE)
##D ## some ac. distribution with a gap
##D mylist3 <- UnivarMixingDistribution(Unif(0,0.3),Unif(0.6,1),mixCoeff=c(0.8,0.2))
##D gaps(mylist3)
##D mylist4 <- UnivarMixingDistribution(Unif(0,0.3),Unif(0.6,1),mixCoeff=c(0.6,0.4))
##D qqplot(mylist3,mylist4)
##D qqplot(mylist3,mylist4,nosym.pCI=TRUE)
## End(Not run)



