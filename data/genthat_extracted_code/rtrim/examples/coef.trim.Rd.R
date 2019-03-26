library(rtrim)


### Name: coef.trim
### Title: Extract TRIM model coefficients.
### Aliases: coef.trim

### ** Examples

data(skylark)
z <- trim(count ~ site + time, data=skylark, model=2, overdisp=TRUE)
coefficients(z)



