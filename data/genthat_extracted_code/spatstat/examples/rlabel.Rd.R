library(spatstat)


### Name: rlabel
### Title: Random Re-Labelling of Point Pattern
### Aliases: rlabel
### Keywords: spatial datagen

### ** Examples

   data(amacrine)

   # Randomly permute the marks "on" and "off"
   # Result always has 142 "off" and 152 "on"
   Y <- rlabel(amacrine)

   # randomly allocate marks "on" and "off"
   # with probabilities p(off) = 0.48, p(on) = 0.52
   Y <- rlabel(amacrine, permute=FALSE)

   # randomly allocate marks "A" and "B" with equal probability
   data(cells)
   Y <- rlabel(cells, labels=factor(c("A", "B")), permute=FALSE)



