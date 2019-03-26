library(R330)


### Name: boxcoxplot
### Title: Draws a Box-Cox plot
### Aliases: boxcoxplot boxcoxplot.lm boxcoxplot.formula
### Keywords: aplot

### ** Examples

data(educ.df)
boxcoxplot(educ~urban + percap + under18, data=educ.df[-50,])

data(wine.df)
boxcoxplot(price~year+temp+h.rain+w.rain,data=wine.df)



