library(HDMD)


### Name: Promax.only
### Title: Promax rotation (without prior Varimax rotation)
### Aliases: Promax.only

### ** Examples

##compare to promax and Promax solutions
fa <- factanal( ~., 2, data = swiss)
Promax(loadings(fa))
Promax.only(loadings(fa))




