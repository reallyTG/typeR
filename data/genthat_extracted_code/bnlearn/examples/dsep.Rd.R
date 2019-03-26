library(bnlearn)


### Name: dsep
### Title: Test d-separation
### Aliases: dsep
### Keywords: graphs

### ** Examples

bn = model2network("[A][C|A][B|C]")
dsep(bn, "A", "B", "C")
bn = model2network("[A][C][B|A:C]")
dsep(bn, "A", "B", "C")



