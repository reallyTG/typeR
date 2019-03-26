library(seriation)


### Name: dissimilarity
### Title: Dissimilarities and Correlations Between Seriation Orders
### Aliases: dist ser_dist ser_cor ser_align
### Keywords: cluster

### ** Examples

set.seed(1234)
## seriate dist of 50 flowers from the iris data set
data("iris")
x <- as.matrix(iris[-5])
x <- x[sample(1:nrow(x), 50),]
rownames(x) <- 1:50
d <- dist(x)

## Create a list of different seriations
methods <- c("HC_single", "HC_complete", "OLO", "GW", "R2E", "VAT",
  "TSP", "Spectral", "SPIN", "MDS", "Identity", "Random")

os <- sapply(methods, function(m) {
  cat("Doing", m, "... ")
  tm <- system.time(o <- seriate(d, method = m))
  cat("took", tm[3],"s.\n")
  o
})

## Compare the methods using distances. Default is based on
## Spearman's rank correlation coefficient. Reverse orders are considered
## equivalent.
ds <- ser_dist(os)
hmap(ds, margin=c(7,7))

## Compare using actual correlation between orders. Reversed orders have
## negative correlation!
cs <- ser_cor(os, reverse = FALSE)
hmap(cs, margin=c(7,7))

## Also check reversed seriation orders.
## Now all but random and identity are highly positive correlated
cs2 <- ser_cor(os, reverse = TRUE)
hmap(cs2, margin=c(7,7))

## Use Manhattan distance of the ranks (i.e., Spearman's foot rule)
ds <- ser_dist(os, method="manhattan")
plot(hclust(ds))



