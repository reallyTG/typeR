library(klaR)


### Name: betascale
### Title: Scale membership values according to a beta scaling
### Aliases: betascale
### Keywords: classif

### ** Examples

library(MASS)
data(B3)
pB3 <- predict(lda(PHASEN ~ ., data = B3))$posterior
pbB3 <- b.scal(pB3, B3$PHASEN)
betascale(pbB3)



