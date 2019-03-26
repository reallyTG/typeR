library(ffstream)


### Name: initFFFMeanCD
### Title: Initialisation of FFF mean change detector
### Aliases: initFFFMeanCD

### ** Examples

library(Rcpp)
fffcd1 <- initFFFMeanCD()               # initialises with alpha=0.01
                                        
fffcd2 <- initFFFMeanCD(0.05, 0.95)     # initialises with alpha=0.05
                                        # and lambda=0.95 (and BL=50)



