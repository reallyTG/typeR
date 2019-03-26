library(bcRep)


### Name: sequences.mutation.base
### Title: Statistics about silent mutations
### Aliases: sequences.mutation.base plotSequencesMutationBase

### ** Examples

data(mutationtab)
data(summarytab)
V.base.mut<-sequences.mutation.base(mutationtab = mutationtab, summarytab = summarytab, 
     sequence = "V", nrCores = 1)

## Not run: 
##D plotSequencesMutationBase(mutationBaseTab = V.base.mut, plotMutation = T)
## End(Not run)




