library(ff)


### Name: add
### Title: Incrementing an ff or ram object
### Aliases: add add.ff add.default
### Keywords: IO data

### ** Examples

   message("incrementing parts of a vector")
   x <- ff(0, length=12)
   y <- rep(0, 12)
   add(x, 1, 1:6)
   add(y, 1, 1:6)
   x
   y

   message("incrementing parts of a matrix")
   x <- ff(0, dim=3:4)
   y <- array(0, dim=3:4)
   add(x, 1, 1:2, 1:2)
   add(y, 1, 1:2, 1:2)
   x
   y

   message("BEWARE that ff and ram methods differ in treatment of duplicated index positions")
   add(x, 1, c(3,3))
   add(y, 1, c(3,3))
   x
   y

   rm(x); gc()



