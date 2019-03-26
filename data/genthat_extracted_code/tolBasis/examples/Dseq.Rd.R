library(tolBasis)


### Name: Dseq
### Title: Date Sequence
### Aliases: Dseq

### ** Examples

# Vector of the monthly dates of the current year
currYear <- Dfloor(Sys.Date(), Yearly)
Dseq(currYear, dating=Monthly, len=12)



