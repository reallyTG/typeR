library(archdata)


### Name: BACups
### Title: Bronze Age Cups from Italy
### Aliases: BACups
### Keywords: datasets

### ** Examples

data(BACups)
by(BACups[, -6], BACups$Phase, summary)
plot(RD~H, BACups, pch=as.numeric(Phase))
legend("topleft", levels(BACups$Phase), pch=1:2)



