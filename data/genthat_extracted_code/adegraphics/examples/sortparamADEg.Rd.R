library(adegraphics)


### Name: sortparamADEg
### Title: Sort a sequence of graphical parameters
### Aliases: sortparamADEg sortparamADEgS
### Keywords: aplot

### ** Examples


l1 <- sortparamADEg(xlab = "x-axis label", ylab = "y-axis label", plabels.cex = 1.5, 
  porigin.include = FALSE)
length(l1)
names(l1)
  
l2 <- sortparamADEgS(xlab = "x-axis label", eig.main = "Eigenvalues", row.ppoints.col = "red",
  porigin.include = FALSE, graphsnames = c("row", "col", "eig"))
names(l2)
names(l2$row)

l3 <- sortparamADEgS(xlab = "x-axis label", eig.main = "Eigenvalues", row.ppoints.col = "pink",
  porigin.include = FALSE, graphsnames = c("row", "col", "eig"), nbsubgraphs = c(1, 2, 1))
names(l3)
length(l3$row)
length(l3$col)



