library(MTLR)


### Name: plot.mtlr
### Title: Graphical Representation of Feature Weights
### Aliases: plot.mtlr

### ** Examples

#These examples are geared towards users who have installed ggplot2 and reshape2.
library(survival)
mod <- mtlr(Surv(time,status)~., data = lung)
#Basic plot with 5 most influential features
plot(mod)
#Plot all 8 features
plot(mod, numfeatures = 8)
#Suppose we want to see specifically the "meal.cal" and "ph.karno" features:
plot(mod, featurenames = c("meal.cal", "ph.karno"))



