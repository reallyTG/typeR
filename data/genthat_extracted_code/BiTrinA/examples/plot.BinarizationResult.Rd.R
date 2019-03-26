library(BiTrinA)


### Name: plot,BinarizationResult-method
### Title: Visualization of binarization results.
### Aliases: plot,BinarizationResult-method
###   plot,BinarizationResult,ANY-method
###   plot,numeric,BinarizationResult-method

### ** Examples

# plot a binarization in one and two dimensions
res <- binarize.BASC(iris[,"Petal.Length"], method="A")
plot(res)
plot(res, twoDimensional = TRUE)
plot(res, twoDimensional = TRUE, 
     pch = c("x", "+"), 
     col = c("red", "black", "royalblue"), 
     lty = 4, lwd = 2)



