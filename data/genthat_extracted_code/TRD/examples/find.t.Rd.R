library(TRD)


### Name: find.t
### Title: Find transmission ratio of minor alleles in mother, father or
###   both parents.
### Aliases: find.t

### ** Examples

trios=rtrios(100000,500,0.1,0.2,0.3,1,0.5,0.5,0.1)
find.t(trios$case)
find.t(trios$ctrl)
find.t(rbind(trios$case,trios$ctrl))



