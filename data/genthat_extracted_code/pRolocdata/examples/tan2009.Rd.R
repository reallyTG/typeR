library(pRolocdata)


### Name: tan2009
### Title: LOPIT data from Tan et al. (2009)
### Aliases: tan2009 tan2009r1 tan2009r2 tan2009r3 tan2009r1goCC
### Keywords: datasets

### ** Examples

data(tan2009r1)
tan2009r1
pData(tan2009r1)
head(exprs(tan2009r1))
# Organelle markers
table(fData(tan2009r1)$markers)
# PLSDA assignment results
table(fData(tan2009r1)$PLSDA)



