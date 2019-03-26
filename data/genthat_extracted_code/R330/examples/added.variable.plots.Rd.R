library(R330)


### Name: added.variable.plots
### Title: Draws an added variable plot for each independent variable
### Aliases: added.variable.plots added.variable.plots.lm
###   added.variable.plots.formula
### Keywords: aplot

### ** Examples

data(rubber.df)
rubber.lm<-lm(abloss~hardness+tensile,data=rubber.df)
par(mfrow=c(1,2))
added.variable.plots(rubber.lm)



