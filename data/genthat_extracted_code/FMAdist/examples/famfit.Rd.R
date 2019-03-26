library(FMAdist)


### Name: fmafit
### Title: Building frequentist model averaging input models
### Aliases: fmafit
### Keywords: ~kwd1 ~kwd2

### ** Examples

data<-rlnorm(500,meanlog=0,sdlog=0.25)
Fset<-c('gamma','weibull','normal','ED')
type<-'P' #by default type<-'Q'
J<-5  #by default J<-10
myfit<-fmafit(data,Fset,J,type)



