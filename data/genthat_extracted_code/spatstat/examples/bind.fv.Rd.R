library(spatstat)


### Name: bind.fv
### Title: Combine Function Value Tables
### Aliases: bind.fv cbind.fv
### Keywords: spatial attribute

### ** Examples

   data(cells)
   K1 <- Kest(cells, correction="border")
   K2 <- Kest(cells, correction="iso")
   # remove column 'theo' to avoid duplication
   K2 <- K2[, names(K2) != "theo"]

   cbind(K1, K2)

   bind.fv(K1, K2, preferred="iso")

   # constrain border estimate to be monotonically increasing
   bm <- cumsum(c(0, pmax(0, diff(K1$border))))
   bind.fv(K1, data.frame(bmono=bm),
               "%s[bmo](r)",
               "monotone border-corrected estimate of %s",
               "bmono") 



