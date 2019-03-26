library(s2dverification)


### Name: Composite
### Title: Computes composites.
### Aliases: Composite
### Keywords: datagen

### ** Examples

blank <- array(0, dim=c(20, 10, 30))

x1 <- blank
t1 <- blank
f1 <- blank

for (i in 1:20) {
  x1[i,,] <- i
}

for (i in 1:30) {
  t1[,,i] <- i
}

# This is 2D propagating sin wave example, where we use (x,y,t) structure of 
# f1 wave field. Compositing (like using stroboscopicc light) at different time 
# steps can lead to modification or cancelation of wave pattern.

for (i in 1:20) {
  for (j in 1:30) {
    f1[i,,j] <- 3*sin(2*pi*x1[i,,j]/5. - 2*pi*t1[i,,j]/6.)
  }
}

occ1 <- rep(0, 30)
occ1[c(2, 5, 8, 11, 14, 17, 20, 23)] <- 1

filled.contour(Composite(var=f1, occ=occ1)$composite[,,1])

occ2 <- rep(0, 30)
occ2[c(3, 9, 15, 21)] <- 1

filled.contour(Composite(var=f1, occ=occ2)$composite[,,1])




