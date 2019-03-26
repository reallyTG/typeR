library(psychotools)


### Name: mscale
### Title: Extract/Replace Measurement Scale
### Aliases: mscale mscale<-
### Keywords: classes

### ** Examples

## methods for "paircomp" data
pc <- paircomp(rbind(
  c(2,  1,  0),
  c(1,  1, -1),
  c(1, -2, -1),
  c(0,  0,  0)))
pc

## extract
mscale(pc)

## replace (collapse to >/=/< scale)
mscale(pc) <- sign(mscale(pc))
pc


## similar for "itemresp" data
ir <- itemresp(cbind(
  c(-1, 0, 1, 1, 0),
  c(0, 1, 2, 1, 2),
  c(1, 2, 1, 1, 3)))
ir

## extract
mscale(ir)

## replace (single scale for all items)
mscale(ir) <- 1:3
ir



