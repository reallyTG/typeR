library(TraMineR)


### Name: seqecmpgroup
### Title: Identifying discriminating subsequences
### Aliases: seqecmpgroup
### Keywords: Event sequences

### ** Examples

data(actcal.tse)
actcal.eseq <- seqecreate(actcal.tse)

##Searching for frequent subsequences, that is, appearing at least 20 times
fsubseq <- seqefsub(actcal.eseq, pmin.support=0.01)

##searching for susbsequences discriminating the most men and women
data(actcal)
discr <- seqecmpgroup(fsubseq, group=actcal$sex, method="bonferroni")
##Printing the six most discriminating subsequences
print(discr[1:6])
##Plotting the six most discriminating subsequences
plot(discr[1:6])




