library(spatstat)


### Name: Kdot
### Title: Multitype K Function (i-to-any)
### Aliases: Kdot
### Keywords: spatial nonparametric

### ** Examples

     # Lansing woods data: 6 types of trees
    woods <- lansing

    ## Don't show: 
woods <- woods[seq(1, npoints(woods), by=80)]
## End(Don't show)

    Kh. <- Kdot(woods, "hickory") 
    # diagnostic plot for independence between hickories and other trees
    plot(Kh.)

    ## Not run: 
##D     # synthetic example with two marks "a" and "b"
##D     pp <- runifpoispp(50)
##D     pp <- pp %mark% factor(sample(c("a","b"), npoints(pp), replace=TRUE))
##D     K <- Kdot(pp, "a")
##D     
## End(Not run)



