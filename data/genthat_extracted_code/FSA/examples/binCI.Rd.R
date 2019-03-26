library(FSA)


### Name: binCI
### Title: Confidence intervals for binomial probability of success.
### Aliases: binCI
### Keywords: htest

### ** Examples

## All types at once
binCI(7,20)

## Individual types
binCI(7,20,type="wilson")
binCI(7,20,type="exact")
binCI(7,20,type="asymptotic")
binCI(7,20,type="asymptotic",verbose=TRUE)

## Multiple types
binCI(7,20,type=c("exact","asymptotic"))
binCI(7,20,type=c("exact","asymptotic"),verbose=TRUE)

## Use with multiple inputs
binCI(c(7,10),c(20,30),type="wilson")
binCI(c(7,10),c(20,30),type="wilson",verbose=TRUE)




