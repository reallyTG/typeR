library(mirt)


### Name: expand.table
### Title: Expand summary table of patterns and frequencies
### Aliases: expand.table
### Keywords: data

### ** Examples


data(LSAT7)
head(LSAT7)
LSAT7full <- expand.table(LSAT7)
head(LSAT7full)

LSAT7full <- expand.table(LSAT7, sample = TRUE)
head(LSAT7full)




