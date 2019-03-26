library(RankAggreg)


### Name: BruteAggreg
### Title: Weighted Rank Aggregation via brute force algorithm
### Aliases: BruteAggreg
### Keywords: optimize robust

### ** Examples

require(gtools)

# rank aggregation without weights
x <- matrix(c("A", "B", "C", "D", "E",
        "B", "D", "A", "E", "C",
        "B", "A", "E", "C", "D",
        "A", "D", "B", "C", "E"), byrow=TRUE, ncol=5)

(toplist <- BruteAggreg(x, 5))

# weighted rank aggregation
set.seed(100)
w <- matrix(rnorm(20), ncol=5)
w <- t(apply(w, 1, sort))

(toplist <- BruteAggreg(x,5,w,"Spearman")) # using the Spearman distance
(toplist <- BruteAggreg(x,5,w,"Kendall")) #using the Kendall distance
plot(toplist)



