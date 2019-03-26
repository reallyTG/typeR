library(DescTools)


### Name: BinTree
### Title: Binary Tree
### Aliases: BinTree PlotBinTree
### Keywords: list

### ** Examples

BinTree(12)

x <- sort(sample(100, 24))
z <- PlotBinTree(x, cex=0.8)


# Plot example - Titanic data, for once from a somwhat different perspective
tab <- apply(Titanic, c(2,3,4), sum)
cprob <- c(1, prop.table(apply(tab, 1, sum))
           , as.vector(aperm(prop.table(apply(tab, c(1,2), sum), 1), c(2, 1)))
           , as.vector(aperm(prop.table(tab, c(1,2)), c(3,2,1)))
)

PlotBinTree(round(cprob[BinTree(length(cprob))],2), horiz=TRUE, cex=0.8,
            main="Titanic")
text(c("sex","age","survived"), y=0, x=c(1,2,3)+1)



