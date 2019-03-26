library(genasis)


### Name: gentransform
### Title: Transforms data structure (vector, "genasis", "openair")
### Aliases: gentransform
### Keywords: gentransform

### ** Examples

## Input as a pair of vectors.
gentransform(c(0.386,0.256,0.182,0.254),
             c("2013-05-01","2013-06-03","2013-07-05","2013-08-07"),
             output="genasis")
gentransform(c(0.386,0.256,0.182,0.254),
             c("2013-05-01","2013-06-03","2013-07-05","2013-08-07"),
             output="openair",pollutant="PeCB")

## Not run: 
##D  ## Data frame inputs:
##D data(kosetice.act.genasis)
##D gentransform(kosetice.act.genasis,input="genasis",output="openair")
##D data(kosetice.pas.openair)
##D gentransform(genpastoact(genoutlier(kosetice.pas.openair,plot=FALSE)$res),
##D              output="genasis")
## End(Not run)



