library(DiscreteFDR)


### Name: match.pvals
### Title: Matching raw p-values with supports
### Aliases: match.pvals

### ** Examples

toyList <- list(c(0.3,0.7,1),c(0.1,0.65,1))
toyRaw1 <- c(0.3,0.65)
match.pvals(toyList,toyRaw1)
toyRaw2 <- c(0.31,0.6)
match.pvals(toyList,toyRaw2)




