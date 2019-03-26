library(rrepast)


### Name: BuildParameterSet
### Title: Builds the simulation parameter set
### Aliases: BuildParameterSet

### ** Examples

## Not run: 
##D    modeldir<- "c:/usr/models/BactoSim(HaldaneEngine-1.0)"
##D    e<- Model(modeldir=modeldir,dataset="ds::Output")
##D    Load(e)
##D 
##D    f<- AddFactor(name="cyclePoint",min=40,max=90)
##D 
##D    p<- GetSimulationParameters(e)
##D 
##D    d<- AoE.LatinHypercube(factors=f)
##D 
##D    p1<- BuildParameterSet(d,p)
## End(Not run)




