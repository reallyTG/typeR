library(cocron)


### Name: cocron.n.coefficients
### Title: Statistical comparisons of n alpha coefficients
### Aliases: cocron.n.coefficients

### ** Examples


# independent alpha coefficients
cocron.n.coefficients(alpha=c(.784,.875,.936), items=c(5,5,5), n=c(51,101,151),
dep=FALSE)

# dependent alpha coefficients
r <- rbind(
 c(1,.8,.6,.75),
 c(NA,1,.65,.7),
 c(NA,NA,1,.55),
 c(NA,NA,NA,1)
)
cocron.n.coefficients(alpha=c(.857,.875,.800,.833), items=c(50,40,35,25), n=100,
dep=TRUE, r=r)




