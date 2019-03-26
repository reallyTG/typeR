library(RankAggreg)


### Name: plot.raggr
### Title: Plot function for raggr object returned by RankAggreg or
###   BruteAggreg
### Aliases: plot.raggr
### Keywords: optimize robust

### ** Examples

# rank aggregation without weights
x <- matrix(c("A", "B", "C", "D", "E",
        "B", "D", "A", "E", "C",
        "B", "A", "E", "C", "D",
        "A", "D", "B", "C", "E"), byrow=TRUE, ncol=5)

(CES <- RankAggreg(x, 5, method="CE", distance="Spearman", rho=.1, verbose=FALSE))
plot(CES)



