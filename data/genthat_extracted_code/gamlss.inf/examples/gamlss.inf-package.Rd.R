library(gamlss.inf)


### Name: gamlss.inf-package
### Title: Models for Mixed (Inflated and Adjusted) Response Variables.
### Aliases: gamlss.inf-package gamlss.inf
### Keywords: package

### ** Examples


# An artificial example using simulated data in [0,1)

# Firstly, we use function gen.Family() to create 
# the logit skew student t (logitSST) distribution which is defined in the (0,1) 
# interval. Then we use function gen.Inf0to1() to create the 0-inflated logitSST 
# distribution defined in [0,1).

gen.Family("SST", "logit")
gen.Inf0to1("logitSST","Zero") 

#now we can generate the data and run the model 

set.seed(10)
Y <- rlogitSSTInf0(300,mu=0.5,sigma=0.7,nu=0.5,tau=5,xi0=0.5,log=FALSE)
m1 <- gamlssInf0to1(y=Y,mu.formula=~1,
                    sigma.formula=~1,
                    nu.formula=~1,
                    tau.formula=~1,
                    xi0.formula=~1,
                    family=logitSST,
                    trace = TRUE)
summary(m1)




