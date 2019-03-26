library(merTools)


### Name: plotFEsim
### Title: Plot the results of a simulation of the fixed effects
### Aliases: plotFEsim

### ** Examples

 fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
 (p1 <- plotFEsim(FEsim(fm1)))



