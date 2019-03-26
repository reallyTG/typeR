library(seriation)


### Name: Robinson
### Title: Create and Recognize Robinson and Pre-Robinson Matrices
### Aliases: Robinson is.robinson random.robinson

### ** Examples

## create a perfect anti Robinson structure
m <- random.robinson(10)
pimage(m)

is.robinson(m)

## permute the structure to make it not Robinsonian. However,
## it is still pre-Robinson.
o <- sample(10)
m2 <- permute(m, ser_permutation(o,o))
pimage(m2)

is.robinson(m2)
is.robinson(m2, pre = TRUE)

## create a binary random Robinson matrix (not anti Robinson)
m3 <- random.robinson(10, anti = FALSE) > .7
pimage(m3)
is.robinson(m3, anti = FALSE)

## create matrices with noise (as distance matrices)
m4 <- as.dist(random.robinson(50, pre = FALSE, noise = .1))
pimage(m4)
criterion(m4, method = "AR")

m5 <- as.dist(random.robinson(50, pre = FALSE, noise = .5))
pimage(m5)
criterion(m5, method = "AR")



