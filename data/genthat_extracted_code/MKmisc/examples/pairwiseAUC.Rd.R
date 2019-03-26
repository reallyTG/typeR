library(MKmisc)


### Name: pairwise.auc
### Title: Compute pairwise AUCs
### Aliases: pairwise.auc
### Keywords: univar

### ** Examples

set.seed(13)
x <- rnorm(100)
g <- factor(sample(1:4, 100, replace = TRUE))
levels(g) <- c("a", "b", "c", "d")
pairwise.auc(x, g)



