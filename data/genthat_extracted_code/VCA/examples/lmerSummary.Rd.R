library(VCA)


### Name: lmerSummary
### Title: Derive VCA-Summary Table from an Object Fitted via Function
###   'lmer'.
### Aliases: lmerSummary

### ** Examples

## Not run: 
##D # fit a model with a VCA-function first
##D data(VCAdata1)
##D fit0 <- remlVCA(y~(device+lot)/day/run, subset(VCAdata1, sample==5))
##D fit0
##D 
##D # fit the same model with function 'lmer' of the 'lme4'-package
##D library(lme4)
##D fit1 <- lmer(y~(1|device)+(1|lot)+(1|device:lot:day)+(1|device:lot:day:run),
##D              subset(VCAdata1, sample==5))
##D lmerSummary(fit1, tab.only=TRUE)
## End(Not run)



