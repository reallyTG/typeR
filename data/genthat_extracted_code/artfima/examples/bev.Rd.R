library(artfima)


### Name: bev
### Title: Beveridge Wheat Price Index, 1500 to 1869
### Aliases: bev
### Keywords: datasets

### ** Examples

data(bev)
#series needs a log transformation as is evident from the plot
plot(bev)
## Not run: 
##D w <- diff(bev)
##D bestModels(w)
## End(Not run)



