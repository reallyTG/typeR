library(rioja)


### Name: read.CEP
### Title: Reads and writes data in Cornell Ecology Program (CEP) format
### Aliases: read.CEP write.CEP
### Keywords: IO file

### ** Examples

## Not run: 
##D pth <- system.file("example.datasets/RLGHLongCore.cep", package="rioja")
##D rlgh <- read.CEP(pth)
##D depth <- as.numeric(gsub("r_", "", rownames(rlgh)))
##D mx <- apply(rlgh, 2, max)
##D rlgh.sub <- rlgh[, mx > 5]
##D strat.plot(rlgh.sub, scale.percent=TRUE, yvar=depth, y.rev=TRUE,
##D wa.order="bottomleft")
## End(Not run)



