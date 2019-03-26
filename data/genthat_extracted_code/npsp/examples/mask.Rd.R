library(npsp)


### Name: mask
### Title: Mask methods
### Aliases: mask mask.bin.data mask.bin.den mask.default mask.locpol.bin

### ** Examples

mask(1:10, 5)
bin <- binning(aquifer[,1:2], aquifer$head, nbin = c(41,41), set.NA = TRUE)
str(mask(bin, mask(bin$binw), warn = TRUE))
str(mask(bin, mask(bin$binw, 1)))



