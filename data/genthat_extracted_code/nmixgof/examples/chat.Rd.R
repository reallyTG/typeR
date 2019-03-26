library(nmixgof)


### Name: chat
### Title: Overdispersion metrics for binomial N-mixture models.
### Aliases: chat

### ** Examples

library(unmarked)
data(mallard)
fm.mallard <- pcount(~ 1 ~ 1, unmarkedFramePCount(y = mallard.y), K=100)
chat(fm.mallard, "m")
chat(fm.mallard, "s")
chat(fm.mallard, "o")



