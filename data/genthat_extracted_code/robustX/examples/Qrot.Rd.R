library(robustX)


### Name: Qrot
### Title: Rotation Matrix to Specific Direction
### Aliases: Qrot
### Keywords: array

### ** Examples

Q <- Qrot(6)
zapsmall(crossprod(Q)) # 6 x 6 unity <==> Q'Q = I  <==> Q orthogonal

if(require("MASS")) {
  Qt <- Qrot(6, transpose = TRUE)
  stopifnot(all.equal(Qt, t(Q)))
  fractions(Qt ^2) # --> 1/6  1/30  etc, in an almost lower-triagonal matrix
}



