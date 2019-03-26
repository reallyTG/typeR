library(wiqid)


### Name: simpleRhat
### Title: The Brooks-Gelman-Rubin (BGR) convergence diagnostic
### Aliases: simpleRhat

### ** Examples

# Get some output to use
data(salamanders)
y <- rowSums(salamanders)
( out <- BoccSS0(y, 5) )

simpleRhat(out)



