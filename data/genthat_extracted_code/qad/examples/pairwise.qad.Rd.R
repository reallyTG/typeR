library(qad)


### Name: pairwise.qad
### Title: Pairwise measures of (asymmetric) dependencies
### Aliases: pairwise.qad

### ** Examples

n <- 100
x <- runif(n, 0, 1)
y <- runif(n, 0, 1)
z <- runif(n, 0, 1)
sample_df <- data.frame(x,y,z)

#qad (Not Run)
#model <- pairwise.qad(sample_df, permutation = TRUE, nperm = 20, DoParallel = TRUE)
#heatmap.qad(model, select = "dependence", fontsize = 20, significance = TRUE)



