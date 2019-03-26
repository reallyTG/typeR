library(car)


### Name: mmps
### Title: Marginal Model Plotting
### Aliases: mmps mmp mmp.lm mmp.glm mmp.default marginalModelPlot
###   marginalModelPlots
### Keywords: hplot regression

### ** Examples

c1 <- lm(infantMortality ~ ppgdp, UN)
mmps(c1)
c2 <- update(c1, ~ log(ppgdp))
mmps(c2)
# include SD lines
p1 <- lm(prestige ~ income + education, Prestige)
mmps(p1, sd=TRUE)
# condition on type:
mmps(p1, ~. | type)
# logisitic regression example
# smoothers return warning messages.
# fit a separate smoother and color for each type of occupation.
m1 <- glm(lfp ~ ., family=binomial, data=Mroz)
mmps(m1)



