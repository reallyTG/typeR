library(netmeta)


### Name: as.data.frame.netmeta
### Title: Additional functions for objects of class netmeta
### Aliases: as.data.frame.netmeta
### Keywords: print

### ** Examples

data(Senn2013)

#
# Conduct network meta-analysis
#
net1 <- netmeta(TE, seTE, treat1, treat2, studlab, data=Senn2013, sm="MD")

as.data.frame(net1)

as.data.frame(net1, details=TRUE)



