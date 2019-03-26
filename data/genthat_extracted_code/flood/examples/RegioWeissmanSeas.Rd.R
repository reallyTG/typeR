library(flood)


### Name: RegioWeissmanSeas
### Title: Quantile estimation: Weissman's extrapolation for seasonal data
### Aliases: RegioWeissmanSeas

### ** Examples

library("evd")
# Local & seasonal (observations of 80 years at one station):
x1 <- rgev(80, 2, 1, 0.2) # observations from season 1
x2 <- rgev(80, 3, 1, 0.3) # observations from season 2
x <- list(x1, x2)
RegioWeissmanSeas(x=x, j=1, p=0.99)

x1 <- matrix(rgev(400, 3, 1, 0.1), ncol=4) # observations of season 1 at 4 stations
x2 <- matrix(rgev(400, 2, 1, 0.3), ncol=4) # observations of season 2 at 4 stations
x <- list(x1, x2)
RegioWeissmanSeas(x=x, j=1, p=0.99)



