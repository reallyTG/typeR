library(cba)


### Name: image
### Title: Matrix Image Plots
### Aliases: implot
### Keywords: cluster hplot

### ** Examples

x <- matrix(sample(c(FALSE, TRUE),100,rep=TRUE),ncol=10,
	    dimnames=list(1:10,LETTERS[1:10]))
implot(x)
implot(x, col=c("white","black"), axes = TRUE)



