library(spatstat)


### Name: fitin.ppm
### Title: Extract the Interaction from a Fitted Point Process Model
### Aliases: fitin fitin.ppm fitin.profilepl
### Keywords: spatial models

### ** Examples

   # unmarked 
   model <- ppm(swedishpines ~1, PairPiece(seq(3,19,by=4)))
   f <- fitin(model)
   f
   plot(f)

# extract fitted interaction coefficients
   coef(f)

   # multitype
   # fit the stationary multitype Strauss process to `amacrine'
   r <- 0.02 * matrix(c(1,2,2,1), nrow=2,ncol=2)
   model <- ppm(amacrine ~1, MultiStrauss(r))
   f <- fitin(model)
   f
   plot(f)



