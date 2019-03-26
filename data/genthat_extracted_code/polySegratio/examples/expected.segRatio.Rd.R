library(polySegratio)


### Name: expected.segRatio
### Title: Compute theoretical segregation proportions for regular
###   autopolyploids
### Aliases: expected.segRatio
### Keywords: manip

### ** Examples

## heterogeneous parents

expected.segRatio(2)
expected.segRatio("Tetraploid")
expected.segRatio("tEtR")
expected.segRatio("octo")
expected.segRatio("Octa")
expected.segRatio(14)
## warning
expected.segRatio(9)

## errors - not run
## expected.segRatio("abcd")
## expected.segRatio(-1)

## homogeneous parents

expected.segRatio("Octa", type.parents="heter")
expected.segRatio("Octa", type.parents="homo")
expected.segRatio("tetra", type.parents="homo")
expected.segRatio(6, type.parents="homo")
expected.segRatio(9, type.parents="homo")




