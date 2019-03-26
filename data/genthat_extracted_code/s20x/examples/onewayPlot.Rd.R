library(s20x)


### Name: onewayPlot
### Title: One-way Analysis of Variance Plot
### Aliases: onewayPlot twosampPlot onewayPlot.default onewayPlot.formula
###   onewayPlot.lm
### Keywords: hplot

### ** Examples


##see example in 'summary1way'

##computer data:
data(computer.df)
onewayPlot(score~selfassess, data = computer.df)


##apple data:
data(apples.df)
twosampPlot(Weight~Propagated, data = apples.df)

##oyster data:
data(oysters.df)
onewayPlot(log(Oysters)~Site, data = oysters.df)

##oyster data:
data(oysters.df)
oyster.fit = lm(log(Oysters)~Site, data = oysters.df)
onewayPlot(oyster.fit)




