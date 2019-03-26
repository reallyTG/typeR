library(reliaR)


### Name: Gompertz
### Title: The Gompertz distribution
### Aliases: Gompertz dgompertz pgompertz qgompertz rgompertz
### Keywords: distribution

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(sys2)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est = 0.00121307, theta.est = 0.00173329

dgompertz(sys2, 0.00121307, 0.00173329, log = FALSE)
pgompertz(sys2, 0.00121307, 0.00173329, lower.tail = TRUE, log.p = FALSE)
qgompertz(0.25, 0.00121307, 0.00173329, lower.tail=TRUE, log.p = FALSE)
rgompertz(30, 0.00121307, 0.00173329)



