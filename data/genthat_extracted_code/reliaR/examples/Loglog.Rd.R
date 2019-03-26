library(reliaR)


### Name: Loglog
### Title: The Loglog distribution
### Aliases: Loglog dloglog ploglog qloglog rloglog
### Keywords: distribution

### ** Examples

data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.9058689 lambda.est = 1.0028228

dloglog(sys2, 0.9058689, 1.0028228, log = FALSE)
ploglog(sys2, 0.9058689, 1.0028228, lower.tail = TRUE, log.p = FALSE)
qloglog(0.25, 0.9058689, 1.0028228, lower.tail=TRUE, log.p = FALSE)
rloglog(30, 0.9058689, 1.0028228)



