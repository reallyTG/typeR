library(ISOpureR)


### Name: ISOpure.util.logsum
### Title: Log-sum-exp
### Aliases: ISOpure.util.logsum
### Keywords: math

### ** Examples

x <-  c(1, 1e20, 1e40, -1e40, -1e20, -1);
x <- as.matrix(x);

# compute log sum exp without the function
log(sum(exp(x)))
#[1] Inf

# compute log sum exp with the function
ISOpure.util.logsum(x, 1)
#[1] 1e+40 



