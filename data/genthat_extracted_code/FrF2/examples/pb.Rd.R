library(FrF2)


### Name: pb
### Title: Function to generate non-regular fractional factorial screening
###   designs
### Aliases: pb pb.list
### Keywords: array design

### ** Examples

   pb(12,randomize=FALSE)
   pb(12,randomize=FALSE,n12.taguchi=TRUE)
   pb(20,seed=29869)
   pb(16,factor.names=list(A="",B="",C="",D=c("min","max"),
          E="",F="",G="",H="",J=c("new","old")))
   pb(8,default.levels=c("current","new"))
   test <- pb(40) ## design created by doubling the 20 run design
   pb(12, ncenter=6) ## 6 center points with default placement
   
   ## Not run: 
##D    ## note: designs in 40, 56, 64, 88, and 96 runs are resolution IV,
##D    ## if the number of factors is up to nruns/2 - 1, e.g.:
##D    plan1 <- pb(40, 19)
##D    length3(plan1)  ## 0 generalized words of length 3
##D    length4(plan1)  ## 228 generalized words of length 4
##D    ## they can be made resolution IV by oldver=TRUE for 
##D    ## nfactors=nruns/2, e.g.:
##D    plan2 <- pb(40, 20)
##D    plan3 <- pb(40, 20, oldver=TRUE)
##D    length3(plan2)  ## 9 generalized words of length 3
##D    length3(plan3)  ## 0 generalized words of length 3
##D    length4(plan3)  ## 285 generalized words of length 4
##D    
##D    ## note: designs in 52, 76, and 100 runs are almost resolution IV,
##D    ## if the number of factors is up to nruns/2 - 1, e.g.:
##D    plan4 <- pb(52, 25)
##D    GR(plan4)       ## generalized resolution 3.92
##D    
##D    ## note: versions >1.3 avoid complete and heavy aliasing of triples of factors 
##D    ## for up to nruns-2 factors for 40, 52, 56, 64, 76, 88, 92 and 96 runs
##D    ## (the same for 100 runs, which were not implemented before version 1.3)
##D    plan5 <- pb(40, 38)
##D    plan6 <- pb(40, 38, oldver=TRUE)
##D    GR(plan5)       ## generalized resolution 3.4
##D    GR(plan6)       ## generalized resolution 3
##D    plan7 <- pb(52, 50)
##D    plan8 <- pb(52, 50, oldver=TRUE)
##D    GR(plan7)       ## generalized resolution 3.62
##D    GR(plan8)       ## generalized resolution 3.15
##D    
## End(Not run)
   


