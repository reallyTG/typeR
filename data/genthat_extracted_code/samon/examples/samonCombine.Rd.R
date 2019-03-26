library(samon)


### Name: samonCombine
### Title: Combines results from separate runs of the samon function
### Aliases: samonCombine

### ** Examples

# outputs from samon -- run on samonPANSS1 with different seeds
data("P1Res001")
data("P1Res002")

# combine them
trt1Results <- samonCombine( objlist = list(P1Res001,P1Res002) )



