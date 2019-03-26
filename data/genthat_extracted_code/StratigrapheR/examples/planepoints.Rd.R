library(StratigrapheR)


### Name: planepoints
### Title: Describes planes by points
### Aliases: planepoints

### ** Examples

strike   <- c(-60, 180,20)
dip      <- c(-60,20,-45)
quadrant <- c("N","W",NA)
inverted <- c(FALSE,FALSE,TRUE)

res <- planepoints(strike,dip,quadrant,inverted)

deci <- c(res$x$dec, res$y$dec, res$z$dec)
inci <- c(res$x$inc, res$y$inc, res$z$inc)

earnet()

earplanes(strike,dip,quadrant,hsphere = "l")
earpoints(deci,inci)




