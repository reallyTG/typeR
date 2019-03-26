library(sequoia)


### Name: EstConf
### Title: Estimate confidence probability
### Aliases: EstConf

### ** Examples

## Not run: 
##D data(SimGeno_example, LH_HSg5, package="sequoia")
##D SeqOUT <- sequoia(GenoM = SimGeno_example,
##D                   LifeHistData = LH_HSg5, MaxSibIter = 0)
##D ConfPr <- EstConf(Ped = SeqOUT$PedigreePar, LifeHistData = LH_HSg5,
##D                  Specs = SeqOUT$Specs, Full = FALSE, nSim = 10)
## End(Not run)




