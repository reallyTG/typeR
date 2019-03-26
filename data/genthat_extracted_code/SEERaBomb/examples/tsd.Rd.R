library(SEERaBomb)


### Name: tsd
### Title: Compute RR vs tsd
### Aliases: tsd
### Keywords: internal

### ** Examples

## Not run: 
##D library(SEERaBomb)
##D pm=simSeerSet()
##D pm=mk2D(pm) 
##D mybrks=c(0,1,5,10)
##D pm=tsd(pm,brks=mybrks,trts=c("noRad","rad"),PYM=TRUE)
##D (lab=paste0("b",paste(mybrks,collapse="_")))
##D LM=pm$L[[lab]]$'rad'
##D names(LM)
##D LM$PyM
##D LM$Obs
##D LM$Exp
##D table(LM$PyM$`(0,1]`$cancer2)
##D table(LM$PyM$`(1,5]`$cancer2)
##D table(LM$PyM$`(5,10]`$cancer2)
## End(Not run)



