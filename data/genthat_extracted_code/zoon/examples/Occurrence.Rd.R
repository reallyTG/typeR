library(zoon)


### Name: Occurrence
### Title: Accessor functions for getting module outputs from a workflow
###   object
### Aliases: Occurrence Covariate Process Model Output

### ** Examples

## Not run: 
##D work1 <- workflow(occurrence = UKAnophelesPlumbeus,
##D                  covariate  = UKAir,
##D                  process    = Background(n = 70),
##D                  model      = list(LogisticRegression, LogisticRegression),
##D                  output     = PrintMap)
##D 
##D Occurrence(work1)
##D Covariate(work1)
##D Process(work1)
##D Model(work1)
##D Model(work1)[[1]]
##D Output(work1)
## End(Not run)



