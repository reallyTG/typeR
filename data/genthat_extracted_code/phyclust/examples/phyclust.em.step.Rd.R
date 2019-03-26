library(phyclust)


### Name: phyclust.em.step
### Title: One EM-step of phyclust
### Aliases: phyclust.em.step
### Keywords: phyclust stepwise

### ** Examples

library(phyclust, quiet = TRUE)

set.seed(1234)
EMC.1 <- .EMC
EMC.1$EM.iter <- 1
# the same as EMC.1 <- .EMControl(EM.iter = 1)
X <- seq.data.toy$org

ret.1 <- phyclust(X, 2, EMC = EMC.1)
ret.2 <- phyclust.em.step(X, ret.phyclust = ret.1)
str(ret.2)

# For semi-supervised clustering.
semi.label <- rep(0, nrow(X))
semi.label[1:3] <- 1
ret.3 <- phyclust.em.step(X, ret.phyclust = ret.1, label = semi.label)
str(ret.3)



