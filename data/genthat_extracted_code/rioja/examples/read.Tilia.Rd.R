library(rioja)


### Name: read.Tilia
### Title: Read data in Tilia format
### Aliases: read.Tilia
### Keywords: IO file

### ** Examples

## Not run: 
##D pth <- system.file("example.datasets/WOLSFELD.TIL", package="rioja")
##D WOLS <- read.Tilia(pth)
##D sel <- WOLS$vars$Sums == "A" | WOLS$vars$Sums == "B"
##D spec <- WOLS$data[, sel]
##D totals <- apply(spec, 1, sum)
##D spec.pc <- spec / totals * 100
##D mx <- apply(spec.pc, 2, max)
##D spec.sub <- spec.pc[, mx > 5]
##D age <- WOLS$levels$Chron2
##D strat.plot(spec.sub, scale.percent=TRUE, yvar=age, y.rev=TRUE,
##D       wa.order="bottomleft")
## End(Not run)



