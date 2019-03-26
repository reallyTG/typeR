library(samon)


### Name: samonCombineIM
### Title: Combines results from separate runs of the samonIM function
### Aliases: samonCombineIM

### ** Examples

# outputs from samonIM -- run on VAS1 with different seeds
data("V1Res001")
data("V1Res002")

# combine them
V1Results <- samonCombineIM( objlist = list(V1Res001,V1Res002) )



