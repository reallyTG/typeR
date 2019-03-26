library(phia)


### Name: testInteractions
### Title: Test Contrasts of Factor Interactions
### Aliases: testInteractions

### ** Examples

# Tests of the interactions described in Boik (1979)
# See ?Boik for a description of the data set

mod.boik <- lm(edr ~ therapy * medication, data=Boik)
Anova(mod.boik)
cntrl.vs.T1 <- list(therapy = c(1, -1, 0))
cntrl.vs.T2 <- list(therapy = c(1, 0, -1))
plcb.vs.doses <- list(medication = c(1, -1/3, -1/3, -1/3))
testInteractions(mod.boik, pairwise="therapy", adjustment="none")
testInteractions(mod.boik, custom=plcb.vs.doses, adjustment="none")
testInteractions(mod.boik, custom=cntrl.vs.T1, across="medication", adjustment="none")
testInteractions(mod.boik, custom=c(cntrl.vs.T1, plcb.vs.doses), adjustment="none")
testInteractions(mod.boik, custom=cntrl.vs.T2, across="medication", adjustment="none")
testInteractions(mod.boik, custom=plcb.vs.doses, across="therapy", adjustment="none")



