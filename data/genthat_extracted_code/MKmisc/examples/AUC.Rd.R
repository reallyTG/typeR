library(MKmisc)


### Name: AUC
### Title: Compute AUC
### Aliases: AUC
### Keywords: univar

### ** Examples

set.seed(13)
x <- rnorm(100) ## assumed as log2-data
g <- sample(1:2, 100, replace = TRUE)
AUC(x, group = g)
## avoid switching AUC
AUC(x, group = g, switchAUC = FALSE)



