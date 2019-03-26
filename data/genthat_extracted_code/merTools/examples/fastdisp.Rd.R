library(merTools)


### Name: fastdisp
### Title: fastdisp: faster display of model summaries
### Aliases: fastdisp fastdisp.merMod fastdisp.merModList

### ** Examples

## Not run: 
##D #Compare the time for displaying this modest model
##D require(arm)
##D m1 <- lmer(y ~ lectage + studage + (1|d) + (1|s), data=InstEval)
##D system.time(display(m1))
##D system.time(fastdisp(m1))
## End(Not run)



