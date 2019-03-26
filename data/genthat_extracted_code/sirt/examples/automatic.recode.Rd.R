library(sirt)


### Name: automatic.recode
### Title: Automatic Method of Finding Keys in a Dataset with Raw Item
###   Responses
### Aliases: automatic.recode
### Keywords: R utilities

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: data.raw1
##D #############################################################################
##D data(data.raw1)
##D 
##D # recode data.raw1 and exclude keys 8 and 9 (missing codes) and
##D # start with initially setting all categories larger than 50 ##D 
##D res1 <- sirt::automatic.recode( data.raw1, exclude=c(8,9), pstart.min=.50 )
##D # inspect calculated keys
##D res1$item.stat
##D 
##D #############################################################################
##D # EXAMPLE 2: data.timssAusTwn from TAM package
##D #############################################################################
##D 
##D miceadds::library_install("TAM")
##D data(data.timssAusTwn,package="TAM")
##D raw.resp <- data.timssAusTwn[,1:11]
##D res2 <- sirt::automatic.recode( data=raw.resp )
## End(Not run)



