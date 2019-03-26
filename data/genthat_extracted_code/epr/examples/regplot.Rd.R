library(epr)


### Name: regplot
### Title: Graphics of the regression
### Aliases: regplot

### ** Examples


# data
data(data5)

d1=data5[,c(1,2)]
regplot(d1, position=8)

d2=data5[,c(1,3)]
regplot(d2, position=8)

d3=data5[,c(1,4)]
regplot(d3, position=8)





