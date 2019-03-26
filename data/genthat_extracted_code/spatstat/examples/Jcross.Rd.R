library(spatstat)


### Name: Jcross
### Title: Multitype J Function (i-to-j)
### Aliases: Jcross
### Keywords: spatial nonparametric

### ** Examples

     # Lansing woods data: 6 types of trees
    woods <- lansing
    ## Don't show: 
       woods <- woods[seq(1,npoints(woods), by=30)]
    
## End(Don't show)
    Jhm <- Jcross(woods, "hickory", "maple")
    # diagnostic plot for independence between hickories and maples
    plot(Jhm)

    # synthetic example with two types "a" and "b"
    pp <- runifpoint(30) %mark% factor(sample(c("a","b"), 30, replace=TRUE))
    J <- Jcross(pp)



