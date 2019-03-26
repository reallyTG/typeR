library(pre)


### Name: pairplot
### Title: Create partial dependence plot for a pair of predictor variables
###   in a prediction rule ensemble (pre)
### Aliases: pairplot

### ** Examples

## No test: 
set.seed(42)
airq.ens <- pre(Ozone ~ ., data = airquality[complete.cases(airquality),])
pairplot(airq.ens, c("Temp", "Wind"))
## End(No test)



