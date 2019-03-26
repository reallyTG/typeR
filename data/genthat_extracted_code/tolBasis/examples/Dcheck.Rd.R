library(tolBasis)


### Name: Dcheck
### Title: Check a Date sequence
### Aliases: Dcheck

### ** Examples

# Check a Date sequence
date.sequence <- Dseq(Date(2010), Date(2014,12), Monthly)
Dcheck(date.sequence, Monthly) #-> TRUE
Dcheck(date.sequence, Quarterly) #-> FALSE



