library(spatstat)


### Name: Jdot
### Title: Multitype J Function (i-to-any)
### Aliases: Jdot
### Keywords: spatial nonparametric

### ** Examples

     # Lansing woods data: 6 types of trees
   woods <- lansing

    ## Don't show: 
        woods <- woods[seq(1,npoints(woods), by=30), ]
    
## End(Don't show)
    Jh. <- Jdot(woods, "hickory")
    plot(Jh.)
    # diagnostic plot for independence between hickories and other trees
    Jhh <- Jest(split(woods)$hickory)
    plot(Jhh, add=TRUE, legendpos="bottom")

    ## Not run: 
##D     # synthetic example with two marks "a" and "b"
##D     pp <- runifpoint(30) %mark% factor(sample(c("a","b"), 30, replace=TRUE))
##D     J <- Jdot(pp, "a")
##D     
## End(Not run)



