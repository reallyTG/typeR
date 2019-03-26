library(pre)


### Name: gpe_rules_pre
### Title: Get rule learner for gpe which mimics behavior of pre
### Aliases: gpe_rules_pre

### ** Examples

## No test: 
## Obtain same fits with pre and gpe
set.seed(42)
gpe.mod <- gpe(Ozone ~ ., data = airquality[complete.cases(airquality),],  
               base_learners = list(gpe_rules_pre(), gpe_linear()))
gpe.mod                
set.seed(42)
pre.mod <- pre(Ozone ~ ., data = airquality[complete.cases(airquality),],)
pre.mod
## End(No test)



