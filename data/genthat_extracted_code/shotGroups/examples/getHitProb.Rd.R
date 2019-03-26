library(shotGroups)


### Name: getHitProb
### Title: Hit probability within given region
### Aliases: getHitProb getHitProb.data.frame getHitProb.default

### ** Examples

# coordinates given by a suitable data frame
# estimated fraction of shots within a circle with radius
# 1 and 1.5 MOA.
getHitProb(DFscar17, r=c(1, 1.5), unit='MOA', accuracy=FALSE,
           dstTarget=100, conversion='yd2in',
           type=c('CorrNormal', 'GrubbsPatnaik'))

# coordinates given by a matrix
## Not run: 
##D xy <- matrix(round(rnorm(100, 0, 5), 2), ncol=2)
##D getHitProb(xy, r=c(2, 2.5), unit='MOA', accuracy=FALSE,
##D            dstTarget=100, conversion='yd2in',
##D            type=c('CorrNormal', 'GrubbsPatnaik'))
## End(Not run)



