library(distr)


### Name: UnivarLebDecDistribution-class
### Title: Class "UnivarLebDecDistribution"
### Aliases: UnivarLebDecDistribution-class
###   AffLinUnivarLebDecDistribution-class AcDcLcDistribution-class acPart
###   discretePart acPart<- discretePart<- acPart-methods
###   discretePart-methods acPart<--methods discretePart<--methods
###   acPart,UnivarLebDecDistribution-method
###   discretePart,UnivarLebDecDistribution-method
###   acPart<-,UnivarLebDecDistribution-method
###   discretePart<-,UnivarLebDecDistribution-method acWeight
###   discreteWeight acWeight<- discreteWeight<- acWeight-methods
###   discreteWeight-methods acWeight<--methods discreteWeight<--methods
###   acWeight,UnivarLebDecDistribution-method
###   discreteWeight,UnivarLebDecDistribution-method
###   acWeight<-,UnivarLebDecDistribution-method
###   discreteWeight<-,UnivarLebDecDistribution-method
###   p.discrete,UnivarLebDecDistribution-method
###   d.discrete,UnivarLebDecDistribution-method
###   q.discrete,UnivarLebDecDistribution-method
###   r.discrete,UnivarLebDecDistribution-method
###   p.ac,UnivarLebDecDistribution-method
###   d.ac,UnivarLebDecDistribution-method
###   q.ac,UnivarLebDecDistribution-method
###   r.ac,UnivarLebDecDistribution-method p.discrete-methods
###   d.discrete-methods q.discrete-methods r.discrete-methods p.ac-methods
###   d.ac-methods q.ac-methods r.ac-methods p.discrete d.discrete
###   q.discrete r.discrete p.ac d.ac q.ac r.ac
###   coerce,AbscontDistribution,UnivarLebDecDistribution-method
###   coerce,DiscreteDistribution,UnivarLebDecDistribution-method
###   coerce,AffLinUnivarLebDecDistribution,UnivarLebDecDistribution-method
###   abs,UnivarLebDecDistribution-method
###   log,UnivarLebDecDistribution-method
###   log10,UnivarLebDecDistribution-method
###   Math,UnivarLebDecDistribution-method
###   ^,AcDcLcDistribution,Dirac-method exp,UnivarLebDecDistribution-method
###   sign,UnivarLebDecDistribution-method sign,AcDcLcDistribution-method
###   sqrt,UnivarLebDecDistribution-method sqrt,AcDcLcDistribution-method
### Keywords: distribution

### ** Examples

wg <- flat.mix(UnivarMixingDistribution(Unif(0,1),Unif(4,5),
               withSimplify=FALSE))
myLC <- UnivarLebDecDistribution(discretePart=Binom(3,.3), acPart = wg,
          discreteWeight=.2)
myLC
p(myLC)(0.3)
r(myLC)(30)
q(myLC)(0.9)
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
acPart(myLC)
plot(myLC)
d.discrete(myLC)(2)
p.ac(myLC)(0)
acWeight(myLC)
plot(acPart(myLC))
plot(discretePart(myLC))
gaps(myLC)
support(myLC)
plot(as(Norm(),"UnivarLebDecDistribution"))



