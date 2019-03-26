library(highD2pop)


### Name: rgammashift
### Title: The centered gamma distribution
### Aliases: rgammashift
### Keywords: distribution datagen

### ** Examples


## The function is currently defined as
function (n, shape, scale) 
{
    x <- rgamma(n = n, shape = shape, scale = scale) - shape*scale
    return(x)
}


x <- rgammashift(500,4,2)

plot(density(x))




