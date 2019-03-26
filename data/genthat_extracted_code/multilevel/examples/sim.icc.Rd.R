library(multilevel)


### Name: sim.icc
### Title: Simulate 2-level ICC(1) values with and without level-1
###   correlation
### Aliases: sim.icc
### Keywords: datagen

### ** Examples

 ## Not run: 
##D set.seed(1535324)
##D ICC.SIM<-sim.icc(gsize=10,ngrp=100,icc1=.15)
##D ICC1(aov(VAR1~as.factor(GRP), ICC.SIM))
##D 
##D # 4 items with no level-1 correlation
##D set.seed(15324)
##D ICC.SIM<-sim.icc(gsize=10,ngrp=100,icc1=.15,nitems=4) #items with no level-1 correlation
##D mult.icc(ICC.SIM[,2:5],ICC.SIM$GRP)
##D with(ICC.SIM,waba(VAR1,VAR2,GRP))$Cov.Theorem  #Examine CorrW 
##D 
##D # 4 items with a level-1 correlation of .30
##D set.seed(15324)
##D ICC.SIM<-sim.icc(gsize=10,ngrp=100,icc1=.15,nitems=4, item.cor=.3) #.30 level-1 item correlations
##D mult.icc(ICC.SIM[,2:5],ICC.SIM$GRP)
##D with(ICC.SIM,waba(VAR1,VAR2,GRP))$Cov.Theorem  #Examine CorrW 
## End(Not run)



