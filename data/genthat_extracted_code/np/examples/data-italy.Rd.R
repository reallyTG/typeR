library(np)


### Name: Italy
### Title: Italian GDP Panel
### Aliases: Italy
### Keywords: datasets

### ** Examples

data("Italy")
attach(Italy)

plot(ordered(year), gdp, xlab="Year (ordered factor)",
     ylab="GDP (millions of Lire, 1990=base)")

detach(Italy)



