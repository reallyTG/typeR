library(flexclust)


### Name: randomTour
### Title: Plot a Random Tour
### Aliases: randomTour randomTourMatrix randomTour,ANY-method
###   randomTour,flexclust-method randomTour,matrix-method
### Keywords: methods hplot

### ** Examples

if(interactive()){
  par(ask=FALSE)
  randomTour(iris[,1:4], axiscol=2:5)
  randomTour(iris[,1:4], col=as.numeric(iris$Species), axiscol=4)

  x <- matrix(runif(300), ncol=3)
  x <- rbind(x, x+1, x+2)
  cl <- cclust(x, k=3, save.data=TRUE)

  randomTour(cl, center=0, axiscol="black")

  ## now use predicted cluster membership for new data as colors
  randomTour(cl, center=0, axiscol="black",
             data=matrix(rnorm(3000, mean=1, sd=2), ncol=3))
}



