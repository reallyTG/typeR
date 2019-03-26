library(weightedScores)


### Name: margmodel
### Title: DENSITY AND CDF OF THE UNIVARIATE MARGINAL DISTRIBUTION
### Aliases: margmodel.ord dmargmodel pmargmodel dmargmodel.ord
###   pmargmodel.ord
### Keywords: distribution

### ** Examples

y<-3
gam<-2.5
invgam<-1/2.5
mu<-0.5
margmodel<-"nb2"
dmargmodel(y,mu,gam,invgam,margmodel)
pmargmodel(y,mu,gam,invgam,margmodel)
link="probit"
dmargmodel.ord(y,mu,gam,link)
pmargmodel.ord(y,mu,gam,link)




