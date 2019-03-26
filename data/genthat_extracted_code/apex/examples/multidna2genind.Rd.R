library(apex)


### Name: multidna2genind
### Title: Convert multidna into genind
### Aliases: multidna2genind multiphyDat2genind

### ** Examples


## simple conversion with nicely ordered output
data(woodmouse)
genes <- list(gene1=woodmouse[,1:500], gene2=woodmouse[,501:965])
x <- new("multidna", genes)
x
y <- multidna2multiphyDat(x)
y
z1 <- multidna2genind(x)
z1
z2 <- multiphyDat2genind(y)
all.equal(z1, z2)




