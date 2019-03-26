library(abd)


### Name: ChimpBrains
### Title: Brodmann's Area 44 in Chimps
### Aliases: ChimpBrains
### Keywords: datasets

### ** Examples

xyplot(asymmetry ~ sex, ChimpBrains)
aggregate(asymmetry ~ sex, ChimpBrains, FUN = favstats)
summary(asymmetry ~ sex, ChimpBrains, fun = favstats)



