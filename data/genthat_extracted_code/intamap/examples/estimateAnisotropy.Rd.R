library(intamap)


### Name: estimateAnisotropy
### Title: estimateAnisotropy
### Aliases: estimateAnisotropy
### Keywords: spatial nonparametric htest

### ** Examples

    library(gstat)
    data(sic2004)
    coordinates(sic.val)=~x+y
    sic.val$value=sic.val$dayx

    params=NULL
    
    estimateAnisotropy(sic.val,depVar = "joker")




