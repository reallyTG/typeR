library(robust)


### Name: anova.lmRob
### Title: ANOVA for Robust Linear Model Fits
### Aliases: anova.lmRob anova.lmRoblist
### Keywords: robust regression methods

### ** Examples

data(stack.dat)
stack.small <- lmRob(Loss ~ Water.Temp + Acid.Conc., data = stack.dat)
stack.full <- lmRob(Loss ~ ., data = stack.dat)
anova(stack.full)
anova(stack.full, stack.small)



