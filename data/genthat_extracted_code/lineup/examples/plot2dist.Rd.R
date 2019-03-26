library(lineup)


### Name: plot2dist
### Title: Plot two sets of inter-individual distances against one another
### Aliases: plot2dist
### Keywords: graphics

### ** Examples

data(expr1, expr2)

## Don't show: 
expr1 <- expr1[,1:500]
expr2 <- expr2[,1:500]
## End(Don't show)

# distances as RMS difference and correlation
d_rmsd <- distee(expr1, expr2, "rmsd")
d_cor <- distee(expr1, expr2, "cor")

# plot distances against one another
plot2dist(d_rmsd, d_cor)




