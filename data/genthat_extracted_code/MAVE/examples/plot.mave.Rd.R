library(MAVE)


### Name: plot.mave
### Title: Plot of mave or mave.dim object
### Aliases: plot.mave plot.mave.dim

### ** Examples

x = matrix(rnorm(2000),400,5)
beta1 = as.matrix(c(1,1,0,0,0))
beta2 = as.matrix(c(0,0,1,1,0))
err = as.matrix(rnorm(400))
y = (x%*%beta1)^2+x%*%beta2+err
dr = mave(y~x, method = 'meanopg')
dr.dim = mave.dim(dr)
plot(dr,dim=3)
plot(dr.dim)



