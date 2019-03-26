library(pre)


### Name: print.pre
### Title: Print method for objects of class pre
### Aliases: print.pre

### ** Examples

## No test: 
set.seed(42)
airq.ens <- pre(Ozone ~ ., data = airquality[complete.cases(airquality),])
print(airq.ens)
## End(No test)



