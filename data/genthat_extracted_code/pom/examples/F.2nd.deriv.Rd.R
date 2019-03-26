library(pom)


### Name: F.2nd.deriv
### Title: Calculate the Hessian Matrix
### Aliases: F.2nd.deriv
### Keywords: methods

### ** Examples

F.test <- function(x){
    3*x[1]^3 + x[1]^2*x[2]^2 + x[2]^3 + x[1]^2*x[3]^4
}
F.2nd.deriv( c(2,3,4), F.test )

# Another Example using siteocc function to get standard errors.
data(weta.data) 
	
fit1 <- siteocc(~1, ~1, histories=weta.data$detection.histories) 
print(fit1)



