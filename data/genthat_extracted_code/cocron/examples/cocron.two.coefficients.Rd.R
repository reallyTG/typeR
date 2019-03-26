library(cocron)


### Name: cocron.two.coefficients
### Title: Statistical comparisons of two alpha coefficients
### Aliases: cocron.two.coefficients

### ** Examples


# independent alpha coefficients
cocron.two.coefficients(alpha=c(.78,.71), n=c(41,151), dep=FALSE)

# dependent alpha coefficients
cocron.two.coefficients(alpha=c(.82,.89), n=27,dep=TRUE, r=.74)




