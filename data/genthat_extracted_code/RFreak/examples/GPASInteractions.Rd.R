library(RFreak)


### Name: GPASInteractions
### Title: Execute the GPAS algorithm for feature selection
### Aliases: GPASInteractions
### Keywords: tree interface

### ** Examples

# load example data
data(data.logicfs)

# execute GPAS to search for interesting interactions
GPASInteractions(cl.logicfs,data.logicfs,runs=1,generations=1000)



