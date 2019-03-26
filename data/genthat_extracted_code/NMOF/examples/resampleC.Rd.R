library(NMOF)


### Name: resampleC
### Title: Resample with Specified Rank Correlation
### Aliases: resampleC
### Keywords: datagen distribution

### ** Examples

## a sample
v1 <- rnorm(20)
v2 <- runif(50)
v3 <- rbinom(100, size = 50, prob = 0.4)

## a correlation matrix
cormat <- array(0.5, dim = c(3, 3))
diag(cormat) <- 1

cor(resampleC(a = v1, b = v2, v3, size = 100, cormat = cormat),
    method = "spearman")



