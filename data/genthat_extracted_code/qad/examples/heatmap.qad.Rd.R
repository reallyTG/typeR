library(qad)


### Name: heatmap.qad
### Title: Heatmap of dependence measures
### Aliases: heatmap.qad

### ** Examples

n <- 1000
x <- runif(n, 0, 1)
y <- x^2 + rnorm(n, 0, 1)
z <- runif(n, 0, 1)
sample_df <- data.frame(x, y, z)

#qad (Not Run)
#model <- pairwise.qad(sample_df, permutation = TRUE, nperm = 10, DoParallel = TRUE)
#heatmap.qad(model, select = "dependence", fontsize = 10, significance = TRUE)



