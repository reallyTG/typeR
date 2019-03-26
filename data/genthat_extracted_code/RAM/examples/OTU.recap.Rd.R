library(RAM)


### Name: OTU.recap
### Title: Summarize OTU
### Aliases: OTU.recap
### Keywords: math

### ** Examples

data(ITS1, ITS2)
ranks <- c("p", "c", "o", "f", "g")
df <- OTU.recap(data=list(ITS1=ITS1, ITS2=ITS2), ranks=ranks)
class(df)



