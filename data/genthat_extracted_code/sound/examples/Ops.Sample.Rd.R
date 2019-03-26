library(sound)


### Name: Ops.Sample
### Title: Basic Operations for Sample Objects
### Aliases: Ops.Sample sum.Sample prod.Sample + - * /
### Keywords: manip

### ** Examples
## Not run: 
##D const <- 2.0
##D e1 <- Sine(440,1)
##D e2 <- Sine(220,1)
##D play((e1+e2)/2) # both samples at a time
##D play(Sine(440,1)*Sine(5,1)) # vibrato
##D 
##D e1 * e2
##D const * e1
##D e1 * const
##D e2 / const
##D 
## End(Not run)


