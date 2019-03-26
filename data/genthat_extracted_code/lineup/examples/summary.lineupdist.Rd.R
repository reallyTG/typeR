library(lineup)


### Name: summary.lineupdist
### Title: Summarize inter-individual distances
### Aliases: summary.lineupdist
### Keywords: utilities

### ** Examples

data(expr1, expr2)

## Don't show: 
expr1 <- expr1[,1:500]
expr2 <- expr2[,1:500]
## End(Don't show)

# distance as correlation
d <- distee(expr1, expr2, "cor")

# summary of potential problems
summary(d)




