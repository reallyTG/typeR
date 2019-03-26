library(gamlss.inf)


### Name: gen.Inf0to1
### Title: Functions to generate inflated 0-to-1 distributions from
###   existing continuous gamlss.family distributions defined in (0,1).
### Aliases: gen.Inf0to1 Inf0to1.d Inf0to1.p Inf0to1.q Inf0to1.r
###   plotInf0to1
### Keywords: distribution regression

### ** Examples

# 1.
gen.Inf0to1("BE","Zero&One")
rBETAInf0to1 <- Inf0to1.r("BE","Zero&One") 
all.equal(rBETAInf0to1, rBEInf0to1) 
plotBEInf0to1()
plotBEInf0to1(mu=0.3,sigma=0.35,xi0=0.5,xi1=0.3)

# 2.
gen.Family("SST", "logit")
gen.Inf0to1("logitSST","One") 
set.seed(30)

args(rlogitSSTInf1)
y <- rlogitSSTInf1(1000,mu=0.2,sigma=0.5,nu=1,tau=5,xi1=0.2)
quantile(y,c(0.1,0.25,0.5,0.75,0.9))

args(qlogitSSTInf1)
qlogitSSTInf1(p=c(0.1,0.25,0.5,0.75,0.9),mu=0.2,sigma=0.5,nu=1,tau=5,xi1=0.2)
plotlogitSSTInf1(mu=0.2,sigma=0.5,nu=1,tau=5,xi1=0.2)




