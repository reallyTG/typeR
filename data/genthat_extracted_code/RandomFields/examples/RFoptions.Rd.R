library(RandomFields)


### Name: RFoptions
### Title: Setting control arguments
### Aliases: RFoptions RFOPTIONS
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

RFoptions()


############################################################
##                                                        ## 
## use of exactness                                       ##
##                                                        ##
############################################################
x <- seq(0, 1, 1/30)
model <- RMgauss()

for (exactness in c(NA, FALSE, TRUE)) { 
  readline(paste("\n\nexactness: `", exactness, "'; press return"))
  z <- RFsimulate(model, x, x, exactness=exactness,
                  stationary_only=NA, storing=TRUE)
  print(RFgetModelInfo(which="internal")$internal$name)
}

## Don't show: 
FinalizeExample()
## End(Don't show)


