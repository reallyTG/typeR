library(pre)


### Name: summary.pre
### Title: Summary method for objects of class pre
### Aliases: summary.pre

### ** Examples

## No test: 
set.seed(42)
airq.ens <- pre(Ozone ~ ., data = airquality[complete.cases(airquality),])
summary(airq.ens)
## End(No test)



