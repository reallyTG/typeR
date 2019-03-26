library(FamEvent)


### Name: summary.simfam
### Title: Summary method for 'simfam'
### Aliases: summary.simfam
### Keywords: summary

### ** Examples

fam <- simfam(N.fam=100, design="pop", variation="frailty", depend=1,
       frailty.dist="gamma", base.dist="Weibull", base.parms=c(0.01, 3), 
       vbeta=c(-1.13, 2.35))
       
summary(fam)
## Not run: 
##D Study design:                           pop 
##D Baseline distribution:                  Weibull 
##D Frailty distribution:                   gamma 
##D Number of families:                     100 
##D Average number of affected per family:  1.28 
##D Average number of carriers per family:  2.3 
##D Average family size:                    16.02 
##D Average age of onset for affected:      39.73 
##D Sampling weights used:                  1
## End(Not run)




