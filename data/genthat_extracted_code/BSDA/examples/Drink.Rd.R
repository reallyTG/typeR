library(BSDA)


### Name: Drink
### Title: Opinion on referendum by view on moral issue of selling
###   alcoholic beverages
### Aliases: Drink
### Keywords: datasets

### ** Examples


T1 <- xtabs(~drinking + referendum, data = Drink)
T1
chisq.test(T1)
rm(T1)




