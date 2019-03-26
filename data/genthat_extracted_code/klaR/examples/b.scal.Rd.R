library(klaR)


### Name: b.scal
### Title: Calculation of beta scaling parameters
### Aliases: b.scal
### Keywords: classif

### ** Examples

library(MASS)
data(B3)
pB3 <- predict(lda(PHASEN ~ ., data = B3))$posterior
pbB3 <- b.scal(pB3, B3$PHASEN, dis = TRUE)
ucpm(pB3, B3$PHASEN)
ucpm(pbB3$member, B3$PHASEN)



