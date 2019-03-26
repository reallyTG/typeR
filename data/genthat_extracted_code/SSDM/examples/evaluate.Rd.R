library(SSDM)


### Name: evaluate
### Title: Evaluate
### Aliases: evaluate evaluate evaluate,Algorithm.SDM-method
###   evaluate,MAXENT.SDM-method evaluate,Stacked.SDM-method

### ** Examples


## Not run: 
##D # Loading data
##D data(Env)
##D data(Occurrences)
##D # SSDM building
##D SSDM <- stack_modelling(c('CTA', 'SVM'), Occurrences, Env, rep = 1,
##D                        Xcol = 'LONGITUDE', Ycol = 'LATITUDE',
##D                        Spcol = 'SPECIES')
##D 
##D # Evaluation
##D evaluate(SSDM)
##D 
## End(Not run)




