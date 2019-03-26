library(distrEx)


### Name: distrExIntegrate
### Title: Integration of One-Dimensional Functions
### Aliases: distrExIntegrate
### Keywords: math utilities

### ** Examples

fkt <- function(x){x*dchisq(x+1, df = 1)}
integrate(fkt, lower = -1, upper = 3)
GLIntegrate(fkt, lower = -1, upper = 3)
try(integrate(fkt, lower = -1, upper = 5))
distrExIntegrate(fkt, lower = -1, upper = 5)



