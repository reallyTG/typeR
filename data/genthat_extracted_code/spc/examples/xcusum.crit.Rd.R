library(spc)


### Name: xcusum.crit
### Title: Compute decision intervals of CUSUM control charts
### Aliases: xcusum.crit
### Keywords: ts

### ** Examples

k <- .5
incontrolARL <- c(500,5000,50000)
sapply(incontrolARL,k=k,xcusum.crit,r=10) # accuracy with 10 nodes
sapply(incontrolARL,k=k,xcusum.crit,r=20) # accuracy with 20 nodes
sapply(incontrolARL,k=k,xcusum.crit)      # accuracy with 30 nodes



