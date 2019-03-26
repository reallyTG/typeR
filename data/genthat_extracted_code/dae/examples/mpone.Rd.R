library(dae)


### Name: mpone
### Title: Converts the first two levels of a factor into the numeric
###   values -1 and +1
### Aliases: mpone
### Keywords: factor manip

### ** Examples

## generate all combinations of two two-level factors
mp <- c("-", "+")
Frf3.trt <- fac.gen(list(A = mp, B = mp))

## add factor C, whose levels are the products of the levles of A and B
Frf3.trt$C <- factor(mpone(Frf3.trt$A)*mpone(Frf3.trt$B), labels = mp)



