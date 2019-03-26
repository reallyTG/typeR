library(DescTools)


### Name: PlotTernary
### Title: Ternary or Triangular Plots
### Aliases: PlotTernary
### Keywords: hplot

### ** Examples

# some random data in three variables
c1 <- runif(25)
c2 <- runif(25)
c3 <- runif(25)

# basic plot
par(mfrow=c(1, 2))
PlotTernary(c1, c2, c3, args.grid=NA)

## Not run: 
##D # plot with different symbols and a grid using a dataset from MASS
##D data(Skye, package="MASS")
##D 
##D PlotTernary(Skye[c(1,3,2)], pch=15, col=hred, main="Skye",
##D             lbl=c("A Sodium", "F Iron", "M Magnesium"))
## End(Not run)



