library(tmod)


### Name: tmodAUC
### Title: Calculate AUC
### Aliases: tmodAUC

### ** Examples

data(tmod)
l <- tmod$GENES$ID
ranks <- 1:length(l)
res <- tmodAUC(l, ranks)
head(res)



