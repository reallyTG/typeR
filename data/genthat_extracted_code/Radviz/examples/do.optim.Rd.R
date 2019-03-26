library(Radviz)


### Name: do.optim
### Title: Optimize the Dimensional Anchors Position using a Genetic
###   Algorithm
### Aliases: do.optim

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
S <- make.S(das)
scaled <- apply(iris[,das],2,do.L)
rv <- do.radviz(scaled,S)
plot(rv,main='Iris Columns',
     point.shape=1,
     point.color=c('red','green','blue')[as.integer(iris$Species)])
sim.mat <- cosine(scaled)
in.da(S,sim.mat) # the starting value
new <- do.optim(S,sim.mat,iter=10,n=100)
new.S <- make.S(get.optim(new))
new.rv <- do.radviz(scaled,new.S)
plot(new.rv,main='Optimized columns',
     point.shape=1,
     point.color=c('red','green','blue')[as.integer(iris$Species)])




