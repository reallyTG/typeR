library(spatstat)


### Name: envelope.lpp
### Title: Envelope for Point Patterns on Linear Network
### Aliases: envelope.lpp envelope.lppm
### Keywords: spatial

### ** Examples

   if(interactive()) {
     ns <- 39
     np <- 40
   } else { ns <- np <- 3 }
   X <- runiflpp(np, simplenet)

   # uniform Poisson: random numbers of points
   envelope(X, nsim=ns)

   # uniform Poisson: conditional on observed number of points
   envelope(X, fix.n=TRUE, nsim=ns)

   # nonuniform Poisson
   fit <- lppm(X ~x)
   envelope(fit, nsim=ns)

   #multitype
   marks(X) <- sample(letters[1:2], np, replace=TRUE)
   envelope(X, nsim=ns)



