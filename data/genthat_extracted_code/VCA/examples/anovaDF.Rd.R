library(VCA)


### Name: anovaDF
### Title: ANOVA Type-I Degrees of Freedom.
### Aliases: anovaDF

### ** Examples

## Not run: 
##D # fully-nested design
##D data(realData)
##D datP1 <- realData[realData$PID==1,]
##D system.time(anova.lm.Tab1 <- anova(lm(y~lot/calibration/day/run, datP1)))
##D system.time(anovaMM.Tab1  <- anovaMM(y~lot/calibration/day/run, datP1))
##D anova.lm.Tab1
##D anovaMM.Tab1
##D 
##D # use SSQ.method="qf" (based on quadratic forms)
##D system.time(anovaMM.Tab1.qf  <- anovaMM(y~lot/calibration/day/run, datP1, SSQ.method="qf"))
##D 
##D # compute degrees of freedom
##D VCA:::anovaDF( y~lot/calibration/day/run, datP1,
##D 				  Zmat=anovaMM.Tab1.qf$Matrices$Z,
##D 				  Amat=anovaMM.Tab1.qf$Matrices$A)
##D 
##D # design with only main-factors
##D system.time(anova.lm.Tab2 <- anova(lm(y~lot+calibration+day+run, datP1)))
##D system.time(anovaMM.Tab2  <- anovaMM(y~lot+calibration+day+run, datP1))
##D anova.lm.Tab2
##D anovaMM.Tab2
##D 
##D # use SSQ.method="qf" (based on quadratic forms)
##D system.time(anovaMM.Tab2.qf  <- anovaMM(y~lot+calibration+day+run, datP1, SSQ.method="qf"))
##D 
##D # compute degrees of freedom
##D VCA:::anovaDF( y~lot+calibration+day+run, datP1,
##D 				  Zmat=anovaMM.Tab2.qf$Matrices$Z,
##D 				  Amat=anovaMM.Tab2.qf$Matrices$A)
##D 
##D # design with main-factors and interactions
##D system.time(anova.lm.Tab3 <- anova(lm(y~(lot+calibration)/day/run, datP1)))
##D system.time(anovaMM.Tab3  <- anovaMM( y~(lot+calibration)/day/run, datP1))
##D anova.lm.Tab3
##D anovaMM.Tab3
##D 
##D # use SSQ.method="qf" (based on quadratic forms)
##D system.time(anovaMM.Tab3.qf  <- anovaMM(y~(lot+calibration)/day/run, datP1, SSQ.method="qf"))
##D 
##D # compute degrees of freedom
##D VCA:::anovaDF( y~(lot+calibration)/day/run, datP1,
##D 				  Zmat=anovaMM.Tab3.qf$Matrices$Z,
##D 				  Amat=anovaMM.Tab3.qf$Matrices$A)
## End(Not run)



