library(RandomFields)


### Name: S02
### Title: Models for stationary max-stable random fields
### Aliases: S02
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0, xi=1)
## seed = 0 : *ANY* simulation will have the random seed 0; set
##            RFoptions(seed=NA) to make them all random again
## xi = 0.5: Frechet margins with alpha=2

## Due to change in the handling the seeds here are different from the
## seeds in the paper.

x <- seq(0, 10, length=128)
## Don't show: 
if(RFoptions()$internal$examples_red){warning("reduced <x>");x<-seq(0,10,length=4)}
## End(Don't show)
# Fig. 1-4
## Not run: 
##D \dontshow{plot(RFsimulate(RPsmith(RMgauss(s=1.5)), x, x))   # < 1 sec
##D plot(RFsimulate(RPsmith(RMball(s=RRspheric(2, 3,
##D R=3.3))), x, x)) # 30  sec
##D plot(RFsimulate(RPschlather(RMexp()), x, x))      #   1 sec
##D plot(RFsimulate(RPschlather(RMgauss()), x, x))    #  17 sec
##D }
## End(Not run)

## Don't show: 
FinalizeExample()
## End(Don't show)


