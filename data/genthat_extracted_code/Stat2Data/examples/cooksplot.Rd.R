library(Stat2Data)


### Name: cooksplot
### Title: Plot of standardized residuals vs. leverage with boundaries for
###   unusual cases
### Aliases: cooksplot

### ** Examples

data(AccordPrice)
mod1=lm(Price~Age,data=AccordPrice)
cooksplot(mod1)




