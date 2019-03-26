library(lineup)


### Name: plot.lineupdist
### Title: Plot summary of inter-individual distances
### Aliases: plot.lineupdist
### Keywords: utilities

### ** Examples

data(expr1, expr2)

## Don't show: 
expr1 <- expr1[,1:500]
expr2 <- expr2[,1:500]
## End(Don't show)

# distance as correlation
d <- distee(expr1, expr2, "cor")

# plot histograms of self-self and self-nonself correlations
plot(d)




