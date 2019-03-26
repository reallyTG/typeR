library(pre)


### Name: interact
### Title: Calculate interaction statistics for variables in a prediction
###   rule ensemble (pre)
### Aliases: interact

### ** Examples

## No test: 
set.seed(42)
 airq.ens <- pre(Ozone ~ ., data=airquality[complete.cases(airquality),])
 interact(airq.ens, c("Temp", "Wind", "Solar.R"))
## End(No test)



