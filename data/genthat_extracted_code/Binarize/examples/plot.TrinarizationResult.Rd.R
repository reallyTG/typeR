library(Binarize)


### Name: plot,TrinarizationResult-method
### Title: Visualization of trinarization results.
### Aliases: plot,TrinarizationResult-method
###   plot,TrinarizationResult,ANY-method
###   plot,numeric,TrinarizationResult-method

### ** Examples

# plot a binarization in one and two dimensions
res <- TASC(iris[,"Petal.Length"])
plot(res)
plot(res, twoDimensional = TRUE)
plot(res, twoDimensional = TRUE, 
	 pch = c("x", "+"), 
	 col = c("red", "black", "royalblue", "green"), 
	 lty = 4, lwd = 2)



