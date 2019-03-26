library(gmm)


### Name: bwWilhelm
### Title: Wilhelm (2015) bandwidth selection
### Aliases: bwWilhelm

### ** Examples

data(Finance)
f1 <- Finance[1:300, "rm"] 
f2 <- Finance[1:300, "hml"] 
f3 <- Finance[1:300, "smb"] 
y <- Finance[1:300,"WMK"]

## Silly example just to make it over-identified
###############################################
res <- gmm(y ~ f1, ~ f1 + f2 + f3)
summary(res)


## Set the bandwidth using the second step estimate
################################################
bw <- bwWilhelm(res)
res2 <- update(res, bw=bw)
summary(res2)

## Set the bandwidth using the first-step estimate as for bwAndrews
###################################################################
res3 <- gmm(y ~ f1, ~ f1 + f2 + f3, bw=bwWilhelm)
summary(res3)







