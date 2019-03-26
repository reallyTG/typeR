library(testforDEP)


### Name: AUK
### Title: Draw Kendall plot and compute AUK.
### Aliases: AUK

### ** Examples

set.seed(123)
x = runif(100)
y = runif(100)

result = AUK(x, y, plot = TRUE)
result$AUK

#[1] 0.4987523



