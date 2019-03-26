library(diffdepprop)


### Name: count.fourfold
### Title: Counts the numbers of discordance and concordance of two tests
### Aliases: count.fourfold

### ** Examples

# create a data set with zero and ones for each of both tests
v1=c(rep(1,10),rep(0,4),rep(1,8),rep(0,8))
v2=c(rep(0,10),rep(1,5),rep(0,5),rep(1,10))
n=c(seq(1,30,1))
new=cbind(n,v1,v2)
# count the number of concordance and discordance
count.fourfold(new,1,2)



