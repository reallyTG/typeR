library(quantities)


### Name: groupGeneric.quantities
### Title: S3 Group Generic Functions
### Aliases: groupGeneric.quantities Math.quantities Ops.quantities
###   Summary.quantities

### ** Examples

x <- set_quantities(1:3, m/s, 0.1)
exp(x)
log(x)
cumsum(x)
cumprod(x)

a <- set_quantities(1:3, m/s, 0.1)
b <- set_quantities(1:3, m/s, 0.1)
a + b
a * b
a / b
a = set_quantities(1:5, m, 0.1)
a %/% a
a %/% set_quantities(2)
set_quantities(1:5, m^2, 0.1) %/% set_quantities(2, m, 0.1)
a %% a
a %% set_quantities(2)
c(min(x), max(x))
range(x)
sum(x)




