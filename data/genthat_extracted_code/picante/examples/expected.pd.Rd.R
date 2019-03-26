library(picante)


### Name: expected.pd
### Title: Expected PD, PD Variance, and Edge Abundance Distribution of a
###   phylogeny
### Aliases: expected.pd variance.pd ead
### Keywords: univar

### ** Examples

randtree <- rcoal(300)
randtree.pd.ub <- variance.pd(randtree, upper.bound=TRUE)
randtree.pd.exact <- variance.pd(randtree, upper.bound=FALSE)
plot(expected.pd(randtree), xlab="Number of tips",
    ylab="Phylogenetic diversity (PD)", type="l", log="xy")
lines(randtree.pd.exact$expected.pd+1.96*sqrt(randtree.pd.exact$variance.pd), lty=2)
lines(randtree.pd.exact$expected.pd-1.96*sqrt(randtree.pd.exact$variance.pd), lty=2)
lines(randtree.pd.ub$expected.pd+1.96*sqrt(randtree.pd.ub$variance.pd), lty=3)
lines(randtree.pd.ub$expected.pd-1.96*sqrt(randtree.pd.ub$variance.pd), lty=3)
legend("bottomright", lty=c(1,2,3), legend=c("Expected PD",
    "95 percent CI (exact)","95 percent CI (upper bound)"))



