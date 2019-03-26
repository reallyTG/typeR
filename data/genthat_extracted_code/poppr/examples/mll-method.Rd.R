library(poppr)


### Name: mll
### Title: Access and manipulate multilocus lineages.
### Aliases: mll mll,genclone-method mll,snpclone-method mll,genind-method
###   mll,genlight-method nmll nmll,genclone-method nmll,snpclone-method
###   nmll,genind-method nmll,genlight-method mll<- mll<-,genclone-method
###   mll<-,snpclone-method

### ** Examples


data(partial_clone)
pc <- as.genclone(partial_clone)
mll(pc)
mll(pc) <- "custom"
mll(pc)
mll.levels(pc) <- LETTERS
mll(pc)



