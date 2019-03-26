library(TripleR)


### Name: selfCor
### Title: partial correlation
### Aliases: selfCor
### Keywords: htest

### ** Examples

data(multiGroup)

RR.style("p")
# a single group
RR1 <- RR(ex~perceiver.id*target.id, data=multiGroup[multiGroup$group.id=="2", ], na.rm=TRUE)
selfCor(RR1)

# multiple groups
RR2 <- RR(ex~perceiver.id*target.id|group.id, data=multiGroup, na.rm=TRUE)
selfCor(RR2)




