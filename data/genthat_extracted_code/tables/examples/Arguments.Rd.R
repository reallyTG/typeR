library(tables)


### Name: Arguments
### Title: 'Arguments' pseudo-function
### Aliases: Arguments

### ** Examples

# This is the example from the weighted.mean help page
wt <- c(5,  5,  4,  1)/15
x <- c(3.7,3.3,3.5,2.8)
gp <- c(1,1,2,2)
tabular( (Factor(gp) + 1) 
	  ~ weighted.mean*x*Arguments(w = wt) )



