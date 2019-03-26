library(pre)


### Name: singleplot
### Title: Create partial dependence plot for a single variable in a
###   prediction rule ensemble (pre)
### Aliases: singleplot

### ** Examples

## No test: 
set.seed(42)
airq.ens <- pre(Ozone ~ ., data = airquality[complete.cases(airquality),])
singleplot(airq.ens, "Temp")
## End(No test)



