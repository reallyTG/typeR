library(pre)


### Name: coef.pre
### Title: Coefficients for the final prediction rule ensemble
### Aliases: coef.pre

### ** Examples

## No test: 
set.seed(42)
airq.ens <- pre(Ozone ~ ., data = airquality[complete.cases(airquality),])
coefs <- coef(airq.ens)
## End(No test)



