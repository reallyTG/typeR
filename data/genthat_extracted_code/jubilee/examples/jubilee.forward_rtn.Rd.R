library(jubilee)


### Name: jubilee.forward_rtn
### Title: Internal utility to calculate annualized forward and backward
###   return
### Aliases: jubilee.forward_rtn jubilee.backward_rtn
### Keywords: utility

### ** Examples

## Not run: 
##D   dtb <- jubilee.repo(online=FALSE)@ie
##D   dtb$fwd.rtn.10 <- jubilee.forward_rtn(dtb$fraction, dtb$log.tri, 10)
##D   dtb$bwd.rtn.10 <- jubilee.backward_rtn(dtb$fraction, dtb$log.tri, 10)
##D   head(subset(dtb, fraction >= 1990),1)$fwd.rtn.10 # 1/1990+10y: 0.16745
##D   tail(subset(dtb, fraction <= 2000+1/12),1)$bwd.rtn.10 # the same as above
## End(Not run)



