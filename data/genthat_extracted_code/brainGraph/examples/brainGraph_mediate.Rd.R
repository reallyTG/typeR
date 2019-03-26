library(brainGraph)


### Name: brainGraph_mediate
### Title: Mediation analysis with brain graph measures as mediator
###   variables
### Aliases: brainGraph_mediate

### ** Examples

## Not run: 
##D med.EglobWt.FSIQ <- brainGraph_mediate(dt.G[threshold == thresholds[5]],
##D   covars.med, 'E.global.wt', 'Group', 'FSIQ', covar.names=c('age', 'gender'),
##D   boot=TRUE, N=1e4)
##D med.strength.FSIQ <-
##D   brainGraph_mediate(dt.V[threshold == thresholds[5] & region == 'lcACC'],
##D                      covars.med, 'strength', 'Group', 'FSIQ',
##D                      covar.names=c('age', 'gender'), N=1e3)
## End(Not run)



