library(evoper)


### Name: NLWrapper.RunExperiment
### Title: NLWrapper.RunExperiment
### Aliases: NLWrapper.RunExperiment

### ** Examples

## Not run: 
##D    rm(list=ls())
##D    objectivefn<- function(params, results) { 0 }
##D 
##D    f<- AddFactor(name="initial-number-sheep",min=100,max=250)
##D    f<- AddFactor(factors=f, name="initial-number-wolves",min=50,max=150)
##D    f<- AddFactor(factors=f, name="grass-regrowth-time",min=30,max=100)
##D    f<- AddFactor(factors=f, name="sheep-gain-from-food",min=1,max=50)
##D    f<- AddFactor(factors=f, name="wolf-gain-from-food",min=1,max=100)
##D    f<- AddFactor(factors=f, name="sheep-reproduce",min=1,max=20)
##D    f<- AddFactor(factors=f, name="wolf-reproduce",min=1,max=20)
##D 
##D    design<- AoE.LatinHypercube(factors=f)
##D 
##D    p<- "C:/Program Files/NetLogo 6.0.4/app"
##D    m<- file.path(p, "models", "Sample Models", "Biology", "Wolf Sheep Predation.nlogo")
##D    output<- c("count sheep", "count wolves")
##D    o<- NLWrapper.Model(p, m, output, 150)
##D    v<- RunExperiment(o, r=1, design, objectivefn)
##D    NLWrapper.Shutdown(o)
## End(Not run)




