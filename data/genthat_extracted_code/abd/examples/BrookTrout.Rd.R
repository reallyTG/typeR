library(abd)


### Name: BrookTrout
### Title: Salmon Survival in the Presence of Brook Trout
### Aliases: BrookTrout BrookTrout2
### Keywords: datasets

### ** Examples

str(BrookTrout)
str(BrookTrout2)

bwplot(proportion.surviving ~ trout, BrookTrout)

aggregate(proportion.surviving ~ trout, BrookTrout, FUN = favstats)
summary(proportion.surviving ~ trout, BrookTrout, fun = favstats)



