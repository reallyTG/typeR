library(EW)


### Name: EWplot
### Title: Plotting the EW polynomials
### Aliases: EWplot
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (f) 
{
    v <- seq(-5, 5, by = 0.2)
    plot(v, f(v), font.lab = 2, type = "o")
  }



