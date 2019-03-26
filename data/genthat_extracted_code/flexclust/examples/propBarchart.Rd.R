library(flexclust)


### Name: propBarchart
### Title: Barcharts and Boxplots for Columns of a Data Matrix Split by
###   Groups
### Aliases: propBarchart propBarchart-class show,propBarchart-method
###   summary,propBarchart-method groupBWplot
### Keywords: hplot

### ** Examples

 ## create a binary matrix from the iris data plus a random noise column
 x <- apply(iris[,-5], 2, function(z) z>median(z))
 x <- cbind(x, Noise=sample(0:1, 150, replace=TRUE))

 ## There are significant differences in all 4 original variables, Noise
 ## has most likely no significant difference (of course the difference
 ## will be significant in alpha percent of all random samples).
 p <- propBarchart(x, iris$Species)
 p
 summary(p)
 propBarchart(x, iris$Species, byvar=TRUE)
 
 x <- iris[,-5]
 x <- cbind(x, Noise=rnorm(150, mean=3))
 groupBWplot(x, iris$Species)
 groupBWplot(x, iris$Species, shade=TRUE)
 groupBWplot(x, iris$Species, shadefun="medianInside")
 groupBWplot(x, iris$Species, shade=TRUE, byvar=TRUE)



