library(gamlss.inf)


### Name: predict.gamlssinf0to1
### Title: Extract Predictor Values and Standard Errors For New Data In a
###   gamlssinf0to1 Model
### Aliases: predict.gamlssinf0to1
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
predict(m1)




