library(pbkrtest)


### Name: data-beets
### Title: beets data
### Aliases: beets data-beets
### Keywords: datasets

### ** Examples

data(beets)

beets$bh <- with(beets, interaction(block, harvest))
summary(aov(yield ~ block + sow + harvest + Error(bh), beets))
summary(aov(sugpct ~ block + sow + harvest + Error(bh), beets))




