library(RankAggreg)


### Name: RankAggreg
### Title: Weighted Rank Aggregation of partial ordered lists
### Aliases: RankAggreg
### Keywords: optimize robust

### ** Examples

# rank aggregation without weights
x <- matrix(c("A", "B", "C", "D", "E",
        "B", "D", "A", "E", "C",
        "B", "A", "E", "C", "D",
        "A", "D", "B", "C", "E"), byrow=TRUE, ncol=5)

(CESnoweights <- RankAggreg(x, 5, method="CE", distance="Spearman", N=100, convIn=5, rho=.1))

# weighted rank aggregation
set.seed(100)
w <- matrix(rnorm(20), ncol=5)
w <- t(apply(w, 1, sort))

# using the Cross-Entropy Monte-Carlo algorithm
(CES <- RankAggreg(x, 5, w, "CE", "Spearman", rho=.1, N=100, convIn=5))
plot(CES)
(CEK <- RankAggreg(x, 5, w, "CE", "Kendall", rho=.1, N=100, convIn=5))

# using the Genetic algorithm
(GAS <- RankAggreg(x, 5, w, "GA", "Spearman"))
plot(GAS)
(GAK <- RankAggreg(x, 5, w, "GA", "Kendall"))

# more complex example (to get a better solution, increase maxIter)
data(geneLists)
topGenes <- RankAggreg(geneLists, 25, method="GA", maxIter=100)
plot(topGenes)



