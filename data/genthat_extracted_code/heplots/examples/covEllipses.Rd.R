library(heplots)


### Name: covEllipses
### Title: Draw classical and robust covariance ellipses for one or more
###   groups
### Aliases: covEllipses covEllipses.boxM covEllipses.data.frame
###   covEllipses.matrix covEllipses.default
### Keywords: hplot

### ** Examples


data(iris)

# compare classical and robust covariance estimates
covEllipses(iris[,1:4], iris$Species)
covEllipses(iris[,1:4], iris$Species, fill=TRUE, method="mve", add=TRUE, labels="")

# method for a boxM object	
x <- boxM(iris[, 1:4], iris[, "Species"])
x
covEllipses(x, fill=c(rep(FALSE,3), TRUE) )
covEllipses(x, fill=c(rep(FALSE,3), TRUE), center=TRUE, label.pos=1:4 )

# method for a list of covariance matrices
cov <- c(x$cov, pooled=list(x$pooled))
df <- c(table(iris$Species)-1, nrow(iris)-3)
covEllipses(cov, x$means, df, label.pos=3, fill=c(rep(FALSE,3), TRUE))
 
covEllipses(cov, x$means, df, label.pos=3, fill=c(rep(FALSE,3), TRUE), center=TRUE)

# scatterplot matrix version
covEllipses(iris[,1:4], iris$Species, 
	fill=c(rep(FALSE,3), TRUE), variables=1:4, 
	fill.alpha=.1)




