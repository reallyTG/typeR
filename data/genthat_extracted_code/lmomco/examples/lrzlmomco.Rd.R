library(lmomco)


### Name: lrzlmomco
### Title: Lorenz Curve of the Distributions
### Aliases: lrzlmomco
### Keywords: quantile function Lorenz curve lifetime/reliability analysis
###   The lmomco functions

### ** Examples

# It is easiest to think about residual life as starting at the origin, units in days.
A <- vec2par(c(0.0, 2649, 2.11), type="gov") # so set lower bounds = 0.0
f <- c(0.25, 0.75) # Both computations report: 0.02402977 and 0.51653731
Lu1 <-   lrzlmomco(f, A)
Lu2 <- f*bfrlmomco(f, A)

# The Lorenz curve is related to the Gini index (G), which is L-CV:
"afunc" <- function(u) { return(lrzlmomco(f=u, A)) }
L <- integrate(afunc, lower=0, upper=1)$value
G <- 1 - 2*L                                                    # 0.4129159
G <- 1 - expect.min.ostat(2,para=A,qua=quagov)*cmlmomco(f=0,A)  # 0.4129159
LCV <- lmomgov(A)$ratios[2]                                     # 0.41291585



