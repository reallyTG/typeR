library(llama)


### Name: input
### Title: Read data
### Aliases: input
### Keywords: models

### ** Examples

# features.csv looks something like
# ID,width,height
# 0,1.2,3
# ...
# performance.csv:
# ID,alg1,alg2
# 0,2,5
# ...
# success.csv:
# ID,alg1,alg2
# 0,T,F
# ...
#input(read.csv("features.csv"), read.csv("performance.csv"),
#    read.csv("success.csv"), costs=10)

# costs.csv:
# ID,width,height
# 0,3,4.5
# ...
#input(read.csv("features.csv"), read.csv("performance.csv"),
#    read.csv("success.csv"), costs=read.csv("costs.csv"))

# costGroups.csv:
# ID,group1,group2
# 0,3,4.5
# ...
#input(read.csv("features.csv"), read.csv("performance.csv"),
#    read.csv("success.csv"),
#    costs=list(groups=list(group1=c("height"), group2=c("width")),
#               values=read.csv("costGroups.csv")))



