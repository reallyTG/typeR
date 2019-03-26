library(survey)


### Name: brrweights
### Title: Compute replicate weights
### Aliases: jk1weights jknweights brrweights
### Keywords: survey

### ** Examples

data(scd)
scdnofpc<-svydesign(data=scd, prob=~1, id=~ambulance, strata=~ESA,
nest=TRUE)

## convert to BRR replicate weights
scd2brr <- as.svrepdesign(scdnofpc, type="BRR")
svymean(~alive, scd2brr)
svyratio(~alive, ~arrests, scd2brr)

## with user-supplied hadamard matrix
scd2brr1 <- as.svrepdesign(scdnofpc, type="BRR", hadamard.matrix=paley(11))
svymean(~alive, scd2brr1)
svyratio(~alive, ~arrests, scd2brr1)





