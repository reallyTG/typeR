library(emdbook)


### Name: Lily
### Title: Glacier lily occurrence and fecundity data
### Aliases: Lily Lily_sum
### Keywords: datasets

### ** Examples

data(Lily_sum)
par(mfrow=c(3,2))
for (i in 9:14) {
  image(matrix(Lily_sum[,i],nrow=16),main=names(Lily_sum)[i])
}



