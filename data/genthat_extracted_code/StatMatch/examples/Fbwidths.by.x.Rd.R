library(StatMatch)


### Name: Fbwidths.by.x
### Title: Computes the Frechet bounds of cells in a contingency table by
###   considering all the possible subsets of the common variables.
### Aliases: Fbwidths.by.x
### Keywords: multivariate

### ** Examples


data(quine, package="MASS") #loads quine from MASS
str(quine)
quine$c.Days <- cut(quine$Days, c(-1, seq(0,50,10),100))
table(quine$c.Days)


# split quine in two subsets
set.seed(4567)
lab.A <- sample(nrow(quine), 70, replace=TRUE)
quine.A <- quine[lab.A, 1:4]
quine.B <- quine[-lab.A, c(1:3,6)]

# compute the tables required by Fbwidths.by.x()
freq.x <- xtabs(~Eth+Sex+Age, data=quine.A)
freq.xy <- xtabs(~Eth+Sex+Age+Lrn, data=quine.A)
freq.xz <- xtabs(~Eth+Sex+Age+c.Days, data=quine.B)

# apply Fbwidths.by.x()
bounds.yz <- Fbwidths.by.x(tab.x=freq.x, tab.xy=freq.xy,
        tab.xz=freq.xz)

bounds.yz$sum.unc

# input tables estimated with pBayes()

pf.x <- pBayes(x=freq.x)
pf.xy <- pBayes(x=freq.xy)
pf.xz <- pBayes(x=freq.xz)

bounds.yz.p <- Fbwidths.by.x(tab.x = pf.x$pseudoB, 
							 tab.xy = pf.xy$pseudoB,
							 tab.xz = pf.xz$pseudoB)




