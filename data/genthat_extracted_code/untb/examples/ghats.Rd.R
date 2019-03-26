library(untb)


### Name: ghats
### Title: Tree counts in 1-ha plots from the Western Ghats mountains
###   (South India)
### Aliases: ghats
### Keywords: datasets

### ** Examples

data(ghats)
# Rank-abundance picture of plot 1 (column 1 in ghats)
plot(extant(count(ghats[,1])))

#histogram of optimal theta across the 50 plots:
hist(apply(ghats,2,optimal.theta),col='gray')




