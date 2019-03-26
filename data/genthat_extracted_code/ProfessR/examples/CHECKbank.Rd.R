library(ProfessR)


### Name: CHECKbank
### Title: Check a set of Question banks
### Aliases: CHECKbank
### Keywords: misc

### ** Examples

 data(QBANK1)
CHECKbank(QBANK1)

############  modify by inserting an error:
QBANK1[[4]]$numANS=NULL

### recheck:
CHECKbank(QBANK1)





