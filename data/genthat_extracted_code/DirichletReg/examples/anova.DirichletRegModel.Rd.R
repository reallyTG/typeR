library(DirichletReg)


### Name: anova.DirichletRegModel
### Title: Compare Dirichlet Regression Models using an LRT
### Aliases: anova.DirichletRegModel

### ** Examples

ALake <- ArcticLake
ALake$AL <- DR_data(ArcticLake[,1:3])
mod0 <- DirichReg(AL ~ 1, ALake)
mod1 <- DirichReg(AL ~ depth, ALake)
mod2 <- DirichReg(AL ~ depth + I(depth^2), ALake)
anova(mod1, mod0, mod2, sorted = TRUE)



