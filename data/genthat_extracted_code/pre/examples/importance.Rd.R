library(pre)


### Name: importance
### Title: Calculate importances of baselearners (rules and linear terms)
###   and input variables in a prediction rule ensemble (pre)
### Aliases: importance

### ** Examples

## No test: 
set.seed(42)
airq.ens <- pre(Ozone ~ ., data = airquality[complete.cases(airquality),])
# calculate global importances:
importance(airq.ens)
# calculate local importances (default: over 25% highest predicted values):
importance(airq.ens, global = FALSE)
# calculate local importances (custom: over 25% lowest predicted values):
importance(airq.ens, global = FALSE, quantprobs = c(0, .25))
## End(No test)



