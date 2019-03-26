library(TRD)


### Name: ll
### Title: Fit Loglinear model with and without adjustment for TRD.
### Aliases: ll

### ** Examples

trios=rtrios(100000,500,0.1,0.2,0.3,1,0.5,0.5,0.1)
out=ll(trios$case,'sample',0.5,0.5,'grr')

cnt=strata.cnt(trios$case)
out=ll(cnt,'counts',0.5,0.5,'grr')




