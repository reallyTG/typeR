library(s20x)


### Name: cooks20x
### Title: Cook's distance plot
### Aliases: cooks20x
### Keywords: hplot

### ** Examples


# Peruvian Indians data
data(peru.df)
peru.fit = lm(BP ~ age + years + I(years^2) + weight + height, data = peru.df)
cooks20x(peru.fit)




