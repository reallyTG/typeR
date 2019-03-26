library(Radviz)


### Name: bubbleRadviz
### Title: A Plotting Function for the Radviz Object
### Aliases: bubbleRadviz
### Keywords: cluster hplot multivariate

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
species <- apply(iris[,c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')],
                 2,
                 tapply,iris$Species,median)
rv <- do.radviz(species,S)
bubbleRadviz(rv,
             bubble.color=c('red','green','blue')[seq(1,length(levels(iris$Species)))],
             bubble.size=table(iris$Species),
             decreasing=TRUE)




