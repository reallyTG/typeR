library(merTools)


### Name: plotREsim
### Title: Plot the results of a simulation of the random effects
### Aliases: plotREsim

### ** Examples

 fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
 (p1 <- plotREsim(REsim(fm1)))
 #Plot just the random effects for the Days slope
 (p2 <- plotREsim(REsim(fm1), facet= list(groupFctr= "Subject", term= "Days")))



