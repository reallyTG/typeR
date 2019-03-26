library(freqweights)


### Name: lmfreq
### Title: 'lmfreq' is used to fit linear models with frequency tables
### Aliases: lmfreq AIC.lmfreq extractAIC.lmfreq logLik.lmfreq print.lmfreq
###   summary.lmfreq print.summary.lmfreq predict.lmfreq .lmfreq
###   logLik.lmfreq extractAIC.lmfreq AIC.lmfreq nobs.lmfreq summary.lmfreq
###   print.lmfreq print.summary.lmfreq predict.lmfreq

### ** Examples


## Benchmark
if(require(hflights)){
  formula <-  ArrDelay ~ DepDelay   
  print(system.time(a <- lm(formula, data=hflights)))  ## ~0.4 seconds 
  print(system.time(b <- lmfreq(formula, data=hflights))) ## ~0.12 seconds. 4x faster
}

l0 <- lm(Sepal.Length ~ Sepal.Width,iris)
summary(l0)

tfq <- tablefreq(iris[,1:2])
lf <- lmfreq(Sepal.Length ~ Sepal.Width,tfq, freq="freq")
summary(lf)

all.equal(coef(lf),coef(l0))
all.equal(AIC(lf),AIC(l0))

newdata <- data.frame(Sepal.Width=c(1,NA,7))
predict(lf, newdata)

if(require(MASS)){
   stepAIC(lf)
}

system.time(lmfreq(Sepal.Length ~ Sepal.Width,tfq, freq="freq"))
system.time(.lmfreq(Sepal.Length ~ Sepal.Width,tfq)) # Fast

library(dplyr)
igrouped <- iris %>% group_by(Species)
models <- igrouped %>% do(model=lmfreq(Sepal.Length ~ Sepal.Width, .))
coefs <- models %>%
  do(cbind(as.data.frame(rbind(coef(.$model))),
           Species=.$Species))
coefs

## Not run: 
##D ## If data is too granular, benchmark is worst
##D n <- 10^6
##D data <- data.frame(y=rnorm(n),x=rnorm(n))
##D system.time(lm(y~x,data)) ## ~5 seconds
##D system.time(lmfreq(y~x,data)) ## ~ 15 seconds
##D system.time(tfq <- tablefreq(data)) ## ~ 5 seconds
##D nrow(tfq) # same number of rows than original data
##D system.time(.lmfreq(y~x,tfq)) ## ~ 10 seconds
## End(Not run)



