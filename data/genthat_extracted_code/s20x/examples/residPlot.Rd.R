library(s20x)


### Name: residPlot
### Title: Fitted values versus residuals plot
### Aliases: residPlot
### Keywords: hplot

### ** Examples


# Peruvian Indians data
data(peru.df)
fit=lm(BP~age+years+weight+height, data = peru.df)
residPlot(fit)




