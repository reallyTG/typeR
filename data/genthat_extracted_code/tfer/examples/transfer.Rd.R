library(tfer)


### Name: transfer
### Title: Glass Transfer, Persistence and Recovery Probabilities
### Aliases: transfer

### ** Examples

library(tfer)

## create a transfer object using default arguments
y = transfer()

## probability table
probs = tprob(y)

## extract the probabilities of recovering 8 to 15
## glass fragments given the user-specified arguments
tprob(y, 8:15) 

## produce a summary table for a transfer object
summary(y)

## barplot of probabilities (default)
plot(y, ptype = 0)
plot(y)

## barplot of transfer frequencies
plot(y, ptype = 1)

## histogram
plot(y, ptype = 2)



