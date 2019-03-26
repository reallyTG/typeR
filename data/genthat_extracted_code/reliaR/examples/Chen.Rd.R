library(reliaR)


### Name: Chen
### Title: The Chen distribution
### Aliases: Chen dchen pchen qchen rchen
### Keywords: distribution

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of beta & lambda for the data(sys2)
## beta.est = 0.262282404, lambda.est = 0.007282371

dchen(sys2, 0.262282404, 0.007282371, log = FALSE)
pchen(sys2, 0.262282404, 0.007282371, lower.tail = TRUE, 
    log.p = FALSE)
qchen(0.25, 0.262282404, 0.007282371, lower.tail = TRUE, log.p = FALSE)
rchen(10, 0.262282404, 0.007282371)



