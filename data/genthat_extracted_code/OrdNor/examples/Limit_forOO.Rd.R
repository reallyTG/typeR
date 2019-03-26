library(OrdNor)


### Name: Limit_forOO
### Title: Finds the feasible correlation range for a pair of ordinal
###   variables
### Aliases: Limit_forOO

### ** Examples

	pvec1 = cumsum( c(0.30, 0.40) )
	pvec2=cumsum(c(0.4, 0, 0.3) ) # The second category is skipped in this setting
 	Limit_forOO(pvec1, pvec2)



