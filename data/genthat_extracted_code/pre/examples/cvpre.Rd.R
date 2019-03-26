library(pre)


### Name: cvpre
### Title: Full k-fold cross validation of a prediction rule ensemble (pre)
### Aliases: cvpre

### ** Examples

## No test: 
set.seed(42)
airq.ens <- pre(Ozone ~ ., data = airquality[complete.cases(airquality),])
airq.cv <- cvpre(airq.ens)
## End(No test)



