library(rrcov)


### Name: PcaGrid
### Title: Robust Principal Components based on Projection Pursuit (PP):
###   GRID search Algorithm
### Aliases: PcaGrid PcaGrid.formula PcaGrid.default
### Keywords: robust multivariate

### ** Examples

    # multivariate data with outliers
    library(mvtnorm)
    x <- rbind(rmvnorm(200, rep(0, 6), diag(c(5, rep(1,5)))),
                rmvnorm( 15, c(0, rep(20, 5)), diag(rep(1, 6))))
    # Here we calculate the principal components with PCAgrid
    pc <- PcaGrid(x, 6)
    # we could draw a biplot too:
    biplot(pc)
    
    # we could use another objective function, and 
    # maybe only calculate the first three principal components:
    pc <- PcaGrid(x, 3, method="qn")
    biplot(pc)
    
    # now we want to compare the results with the non-robust principal components
    pc <- PcaClassic(x, k=3)
    # again, a biplot for comparision:
    biplot(pc)



