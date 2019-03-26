library(rrepast)


### Name: ParallellRunExperiment
### Title: ParallellRunExperiment
### Aliases: ParallellRunExperiment

### ** Examples

## Not run: 
##D    my.cost<- function(params, results) { # your best fit calculation, being 0 the best metric.  }
##D    d<- "/usr/models/your-model-directory"
##D    f<- AddFactor(name="cyclePoint",min=40,max=90)
##D    f<- AddFactor(factors=f, name="conjugationCost",min=1,max=80)
##D    d<- AoE.LatinHypercube(factors=f)
##D    v<- ParallellRunExperiment()
## End(Not run)




