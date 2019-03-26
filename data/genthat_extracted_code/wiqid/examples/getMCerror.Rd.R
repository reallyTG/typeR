library(wiqid)


### Name: getMCerror
### Title: MCMC error using the batch method
### Aliases: getMCerror

### ** Examples

# Get some output to use
data(salamanders)
y <- rowSums(salamanders)
( out <- BoccSS0(y, 5) )

getMCerror(out)
getMCerror(out, SDpc=TRUE)



