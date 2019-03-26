library(pre)


### Name: bsnullinteract
### Title: Compute bootstrapped null interaction prediction rule ensembles
### Aliases: bsnullinteract

### ** Examples

## No test: 
set.seed(42)
airq.ens <- pre(Ozone ~ ., data=airquality[complete.cases(airquality),])
nullmods <- bsnullinteract(airq.ens)
interact(airq.ens, nullmods = nullmods, col = c("#7FBFF5", "#8CC876"))
## End(No test)



