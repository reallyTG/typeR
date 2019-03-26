library(secrdesign)


### Name: getdetectpar
### Title: Ballpark Detection Parameters
### Aliases: getdetectpar
### Keywords: datagen

### ** Examples


tr <- traps(captdata)
detector(tr) <- "multi"
msk <- make.mask(tr, buffer = 100, type = 'trapbuffer')
getdetectpar(D = 5.48, C = 235, traps = tr, mask = msk, noccasions = 5)




