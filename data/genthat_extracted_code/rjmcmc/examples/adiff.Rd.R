library(rjmcmc)


### Name: adiff
### Title: Automatic Differentiation Using Madness
### Aliases: adiff

### ** Examples

x2x3 = function(x){
return(c(x^2, x^3))
}

y = adiff(x2x3, c(5,6))
attr(y, "gradient")




