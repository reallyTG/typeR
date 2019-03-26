library(CEoptim)


### Name: CEoptim
### Title: Cross-Entropy optimizer
### Aliases: CEoptim

### ** Examples

## Maximizing the Peaks Function


fun <- function(x){
return(3*(1-x[1])^2*exp(-x[1]^2 - (x[2]+1)^2)
	-10*(x[1]/5-x[1]^3 - x[2]^5)*exp(-x[1]^2 - x[2]^2)
	-1/3*exp(-(x[1]+1)^2 - x[2]^2))}

set.seed(1234)

mu0 <- c(-3,-3); sigma0 <- c(10,10)
 
res <- CEoptim(fun,continuous=list(mean=mu0, sd=sigma0), maximize=TRUE)

## To extract the Optimal value of fun
res$optimum
## To extract the location of the optimal value
res$optimizer$continuous
## print function gives the following default values
print(res)



