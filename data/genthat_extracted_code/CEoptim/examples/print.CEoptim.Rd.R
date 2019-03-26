library(CEoptim)


### Name: print
### Title: Print method for the CEoptim object
### Aliases: print.CEoptim

### ** Examples

## Maximizing the Peaks Function


fun <- function(x){
return(3*(1-x[1])^2*exp(-x[1]^2 - (x[2]+1)^2)
	-10*(x[1]/5-x[1]^3 - x[2]^5)*exp(-x[1]^2 - x[2]^2)
	-1/3*exp(-(x[1]+1)^2 - x[2]^2))}

set.seed(1234)

mu0 <- c(-3,-3); sigma0 <- c(10,10)
 
res <- CEoptim(fun,continuous=list(mean=mu0, sd=sigma0), maximize=TRUE)

## Print method provides by default 
## optimizer; optimum and termination.
print(res)
## To print only the Optimal value of fun
print(res,optimum=TRUE)
## To print only the location of the optimal value
print(res,optimizer=TRUE)
## To print only termination information
print(res,termination=TRUE)



