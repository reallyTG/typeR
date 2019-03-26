library(MixfMRI)


### Name: Summarized Overlap
### Title: Summarized Overlap
### Aliases: summarized.overlap
### Keywords: programming

### ** Examples

library(MixfMRI, quietly = TRUE)
set.seed(1234)
p <- 10  # 10 experiments.
overlap.mat <- diag(1, p)
overlap.mat[lower.tri(overlap.mat)] <- runif(p * (p - 1) / 2)
overlap.mat[upper.tri(overlap.mat)] <- t(overlap.mat)[upper.tri(overlap.mat)]
summarized.overlap(overlap.mat)



