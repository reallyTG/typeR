library(pmml)


### Name: makeOutputNodes
### Title: Add Output nodes to a PMML object.
### Aliases: makeOutputNodes

### ** Examples

# make 2 nodes, one with attributes 
TwoNodes <- makeOutputNodes(name=list("OutputField","OutputField"),
             attributes=list(list(name="dbl",optype="continuous"),NULL),
             expression=list("ln(x)","ln(x/(1-x))"))



