library(klaR)


### Name: quadtrafo
### Title: Transforming of 4 dimensional values in a barycentric coordinate
###   system.
### Aliases: quadtrafo quadpoints quadlines
### Keywords: internal

### ** Examples

library(MASS)
data(B3)
posterior <- predict(lda(PHASEN ~ ., data = B3))$post
quadtrafo(posterior)



