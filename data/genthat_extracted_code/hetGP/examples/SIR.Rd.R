library(hetGP)


### Name: sirEval
### Title: SIR test problem
### Aliases: sirEval sirSimulate

### ** Examples

## SIR test problem illustration
ngrid <- 10 # increase
xgrid <- seq(0, 1, length.out = ngrid)
Xgrid <- as.matrix(expand.grid(xgrid, xgrid))

nrep <- 5 # increase
X <- Xgrid[rep(1:nrow(Xgrid), nrep),]
Y <- apply(X, 1, sirEval)
dataSIR <- find_reps(X, Y)
filled.contour(xgrid, xgrid, matrix(lapply(dataSIR$Zlist, sd), ngrid),
               xlab = "Susceptibles", ylab = "Infecteds", color.palette = terrain.colors)




