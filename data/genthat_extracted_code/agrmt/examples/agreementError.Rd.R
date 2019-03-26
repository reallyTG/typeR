library(agrmt)


### Name: agreementError
### Title: Simulated coding error for agreement A
### Aliases: agreementError

### ** Examples

# Sample data:
V <- c(1,1,1,1,2,3,3,3,3,4,4,4,4,4,4)
# Calculate agreement A with coding error:
agreementError(V)
# Assume that all values could have coding error:
agreementError(V, e=1)
# Run the function a few times and show the mean:
z <- replicate(1000, agreementError(V))
mean(z) 
hist(z) # etc.
# you could also use the compareAgreement function.



