library(verification)


### Name: verify
### Title: Verification function
### Aliases: verify
### Keywords: file

### ** Examples

# binary/binary example
obs<- round(runif(100))
pred<- round(runif(100))

# binary/binary example
# Finley tornado data.

obs<- c(28, 72, 23, 2680)
A<- verify(obs, pred = NULL, frcst.type = "binary", obs.type = "binary")

summary(A)

# categorical/categorical example
# creates a simulated 5 category forecast and observation.
obs <- round(runif(100, 1,5) )
pred <- round(runif(100, 1,5) )

A<- verify(obs, pred, frcst.type = "cat", obs.type = "cat" )
summary(A)

#  probabilistic/ binary example

pred<- runif(100)
A<- verify(obs, pred, frcst.type = "prob", obs.type = "binary")
summary(A)

# continuous/ continuous example
obs<- rnorm(100)
pred<- rnorm(100)
baseline <- rnorm(100, sd = 0.5) 

A<- verify(obs, pred, baseline = baseline,  frcst.type = "cont", obs.type = "cont")
summary(A)



