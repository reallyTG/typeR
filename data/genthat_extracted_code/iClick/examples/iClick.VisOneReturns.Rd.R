library(iClick)


### Name: iClick.VisOneReturns
### Title: Visualize Asset Returns
### Aliases: iClick.VisOneReturns

### ** Examples

data("world20")
y=na.omit(diff(log(world20[,1])))

## Simulation data
#dat=rnorm(200,5,1)
#y=ts(dat, start = c(1970, 1), frequency = 12)
iClick.VisOneReturns(y)




