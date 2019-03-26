library(uclust)


### Name: plot_uhclust
### Title: Plot function for the result of uhclust
### Aliases: plot_uhclust

### ** Examples


x = matrix(rnorm(100000),nrow=50)
x[1:35,] = x[1:35,]+0.7
x[1:15,] = x[1:15,]+0.4
res = uhclust(data=x, plot=FALSE)
plot_uhclust(res)




