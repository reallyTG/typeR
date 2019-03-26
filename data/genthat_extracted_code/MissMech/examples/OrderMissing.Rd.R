library(MissMech)


### Name: OrderMissing
### Title: Order Missing Data Pattern
### Aliases: OrderMissing print.orderpattern summary.orderpattern

### ** Examples

set.seed <- 50
n <- 200
p <- 4
pctmiss <- 0.2
y <- matrix(rnorm(n * p),nrow = n)
missing <- matrix(runif(n * p), nrow = n) < pctmiss
y[missing] <- NA
out <- OrderMissing(y, del.lesscases = 0)
a <- out$caseorder
z = out$data
y[a,] # Reverting the original data to the new output order
z[order(a),] # Reverting the ordered datat to the original order



