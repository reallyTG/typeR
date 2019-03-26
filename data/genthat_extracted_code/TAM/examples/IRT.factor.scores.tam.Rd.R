library(TAM)


### Name: IRT.factor.scores
### Title: Extracting Factor Scores in 'TAM'
### Aliases: IRT.factor.scores.tam IRT.factor.scores.tam.mml
###   IRT.factor.scores.tam.mml.3pl IRT.factor.scores.tamaan
### Keywords: Factor scores

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: data.sim.rasch - Different factor scores in Rasch model
##D #############################################################################
##D 
##D data(data.sim.rasch)
##D # 1PL estimation
##D mod1 <- TAM::tam.mml(resp=data.sim.rasch)
##D # EAP
##D pmod1 <- IRT.factor.scores( mod1 )
##D # WLE
##D pmod1 <- IRT.factor.scores( mod1, type="WLE" )
##D # MLE
##D pmod1 <- IRT.factor.scores( mod1, type="MLE" )
## End(Not run)



