library(CDM)


### Name: cdm.est.class.accuracy
### Title: Classification Reliability in a CDM
### Aliases: cdm.est.class.accuracy
### Keywords: Classification reliability

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: DINO data example
##D #############################################################################
##D 
##D data(sim.dino, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D #***
##D # Model 1: estimate DINO model with din
##D mod1 <- CDM::din( sim.dino, q.matrix=sim.qmatrix, rule="DINO")
##D # estimate classification reliability
##D cdm.est.class.accuracy( mod1, n.sims=5000)
##D 
##D #***
##D # Model 2: estimate DINO model with gdina
##D mod2 <- CDM::gdina( sim.dino, q.matrix=sim.qmatrix, rule="DINO")
##D # estimate classification reliability
##D cdm.est.class.accuracy( mod2 )
##D 
##D m1 <- mod1$coef[, c("guess", "slip" ) ]
##D m2 <- mod2$coef
##D m2 <- cbind( m1, m2[ seq(1,18,2), "est" ],
##D           1 - m2[ seq(1,18,2), "est" ]  - m2[ seq(2,18,2), "est" ]  )
##D colnames(m2) <- c("g.M1", "s.M1", "g.M2", "s.M2" )
##D   ##   > round( m2, 3 )
##D   ##          g.M1  s.M1  g.M2  s.M2
##D   ##   Item1 0.109 0.192 0.109 0.191
##D   ##   Item2 0.073 0.234 0.072 0.234
##D   ##   Item3 0.139 0.238 0.146 0.238
##D   ##   Item4 0.124 0.065 0.124 0.009
##D   ##   Item5 0.125 0.035 0.125 0.037
##D   ##   Item6 0.214 0.523 0.214 0.529
##D   ##   Item7 0.193 0.514 0.192 0.514
##D   ##   Item8 0.246 0.100 0.246 0.100
##D   ##   Item9 0.201 0.032 0.195 0.032
##D # Note that s (the slipping parameter) substantially differs for Item4
##D # for DINO estimation in 'din' and 'gdina'
## End(Not run)



