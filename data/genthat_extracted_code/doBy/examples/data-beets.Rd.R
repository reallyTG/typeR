library(doBy)


### Name: data-beets
### Title: beets data
### Aliases: data-beets beets
### Keywords: datasets

### ** Examples

data(beets)

beets$bh <- with(beets, interaction(block, harvest))
summary(aov(yield ~ block + sow + harvest + Error(bh), beets))
summary(aov(sugpct ~ block + sow + harvest + Error(bh), beets))




