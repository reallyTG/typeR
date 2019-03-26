library(RFreak)


### Name: GPASDiscrimination
### Title: Execute the GPAS algorithm for discrimination
### Aliases: GPASDiscrimination
### Keywords: tree interface

### ** Examples

# load example data
data(data.logicfs)

# execute GPAS to discriminate between cases and controls
GPASDiscrimination(cl.logicfs,data.logicfs,runs=1,generations=1000)



