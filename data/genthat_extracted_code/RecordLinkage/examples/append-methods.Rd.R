library(RecordLinkage)


### Name: %append%-methods
### Title: Concatenate comparison patterns or classification results
### Aliases: %append%-methods %append%
###   %append%,RecLinkData,RecLinkData-method
###   %append%,RecLinkResult,RecLinkResult-method
### Keywords: methods

### ** Examples

data(RLdata500)
rpairs1=compare.dedup(RLdata500, blockfld=1, identity = identity.RLdata500)
rpairs2=compare.dedup(RLdata500, blockfld=3, identity = identity.RLdata500)

summary(rpairs1)
summary(rpairs2)
summary(rpairs1 %append% rpairs2)



