library(pre)


### Name: corplot
### Title: Plot correlations between baselearners in a prediction rule
###   ensemble (pre)
### Aliases: corplot

### ** Examples

## No test: 
set.seed(42)
airq.ens <- pre(Ozone ~ ., data = airquality[complete.cases(airquality),])
corplot(airq.ens)
## End(No test)



