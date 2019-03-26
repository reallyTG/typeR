library(gamlss.inf)


### Name: term.plotInf0to1
### Title: Plot regression terms for a specified parameter of a fitted
###   gamlssInf0to1 object
### Aliases: term.plotInf0to1
### Keywords: regression

### ** Examples


gen.Family("SST", "logit")
gen.Inf0to1("logitSST","Zero") 
set.seed(10)
Y <- rlogitSSTInf0(500,mu=0.5,sigma=0.7,nu=0.5,tau=5,xi0=0.5,log=FALSE)
dat <- data.frame(Y)
dat$x <- rnorm(500)
m1 <- gamlssInf0to1(y=Y,mu.formula=~x, sigma.formula=~x,
                    nu.formula=~x, tau.formula=~x,
                    xi0.formula=~x,data=dat, family=logitSST)

# term.plot for the mu parameter
term.plot(m1$dist,parameter="mu")
term.plotInf0to1(m1,parameter="mu",col.shaded = 2)

# term.plot for the binomial parameter
term.plot(m1$multinom,parameter="mu")
term.plotInf0to1(m1,parameter="xi0",col.shaded = 2)




