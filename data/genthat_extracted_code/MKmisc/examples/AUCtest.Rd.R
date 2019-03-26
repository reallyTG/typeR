library(MKmisc)


### Name: AUC.test
### Title: AUC-Test
### Aliases: AUC.test
### Keywords: univar

### ** Examples

set.seed(13)
x <- rnorm(100) ## assumed as log2-data
g <- sample(1:2, 100, replace = TRUE)
AUC.test(x, g)
y <- rnorm(100) ## assumed as log2-data
h <- sample(1:2, 100, replace = TRUE)
AUC.test(x, g, y, h)



