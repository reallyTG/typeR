library(arm)


### Name: triangleplot
### Title: Triangle Plot
### Aliases: triangleplot
### Keywords: dplot

### ** Examples

old.par <- par(no.readonly = TRUE)

 # create a square matrix
 x <- matrix(runif(1600, 0, 1), 40, 40)
 
 # fig 1
 triangleplot(x)
 
 # fig 2 assign cutting points
 triangleplot(x, cutpts=c(0,0.25,0.5,0.75,1), digits=2)
 
 # fig 3 if x contains missing value
 x[12,13] <- x[13,12] <- NA
 x[25,27] <- x[27,25] <- NA
 triangleplot(x)
 
par(old.par)

#
#library(RColorBrewer)
#cormat <-  cor(iris[,-5])
#triangleplot2(cormat,color = brewer.pal( 5, "RdBu" ),
# n.col.legend=5, cex.col=0.7, cex.var=0.5)




