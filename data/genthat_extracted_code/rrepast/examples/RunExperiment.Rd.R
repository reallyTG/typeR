library(rrepast)


### Name: RunExperiment
### Title: Run an experimental setup
### Aliases: RunExperiment

### ** Examples

## Not run: 
##D    my.cost<- function(params, results) { # your best fit calculation, being 0 the best metric.  }
##D    d<- "c:/usr/models/your-model-directory"
##D    m<- Model(d,dataset="ds::Output")
##D    Load(m)
##D    f<- AddFactor(name="cyclePoint",min=40,max=90)
##D    f<- AddFactor(factors=f, name="conjugationCost",min=1,max=80)
##D    d<- LatinHypercube(factors=f)
##D    p<- GetSimulationParameters(e)
##D    exp.design<- BuildParameterSet(d,p)
##D    v<- RunExperiment(e,r=1,exp.design,my.cost) 
## End(Not run)




