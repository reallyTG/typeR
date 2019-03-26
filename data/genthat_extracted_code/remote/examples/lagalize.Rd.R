library(remote)


### Name: lagalize
### Title: Create lagged RasterStacks
### Aliases: lagalize

### ** Examples

data(pacificSST)
data(australiaGPCP)

# lag GPCP by 4 months
lagged <- lagalize(pacificSST, australiaGPCP, lag = 4, freq = 12)
lagged[[1]][[1]] #check names to see date of layer
lagged[[2]][[1]] #check names to see date of layer




