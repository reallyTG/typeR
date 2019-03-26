library(nlr)


### Name: convexpr2nlform
### Title: Convert 'expression' to 'nl.form'
### Aliases: convexpr2nlform
### Keywords: gradient hessian expression nonlinear regression model

### ** Examples

## The function is currently defined as
nlf=convexpr2nlform(yr ~ (a)*(exp(-b*xr)-exp(-c*xr)), start = list(a=.05,b=4.39,c=21.6))
nlf



