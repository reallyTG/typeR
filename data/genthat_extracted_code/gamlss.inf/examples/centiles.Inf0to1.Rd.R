library(gamlss.inf)


### Name: centiles.Inf0to1
### Title: Plotting centile curves for a 'gamlssInf0to1' and 'gamlssZadj'
###   object
### Aliases: centiles.Inf0to1 centiles.Zadj
### Keywords: regression

### ** Examples

## Not run: 
##D gen.Family("SST", "logit")
##D gen.Inf0to1("logitSST","One") 
##D set.seed(30)
##D x <- seq(0,1,l=2000)
##D dat <- data.frame(x)
##D dat$Y <- rlogitSSTInf1(2000,mu=-3+10*x-0.7*x^2,sigma=0.9,nu=0.5,
##D                        tau=5,xi1=plogis(-0.5*ifelse(x>0.7,-1,13)),log=FALSE)
##D 
##D m1 <- gamlssInf0to1(y=Y,mu.formula=~pb(x), sigma.formula=~pb(x),
##D                     nu.formula=~pb(x), tau.formula=~pb(x),
##D                     xi1.formula=~pb(x),
##D                     data=dat, family=logitSST)
##D 
##D centiles.Inf0to1(m1,xvar= dat$x, cent=c(2,10,25,50,75,90,98),
##D col.centiles=c(1,7:2),
##D ylab="proportion", xlab="x",legend=FALSE,main="(c) Inf. logitSST")
## End(Not run)



