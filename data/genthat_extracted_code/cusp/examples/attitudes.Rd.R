library(cusp)


### Name: attitudes
### Title: Multistability in political attitudes
### Aliases: attitudes attitudeStartingValues
### Keywords: datasets

### ** Examples

data(attitudes)
data(attitudeStartingValues)
## Not run: 
##D fit <- cusp(y ~ Attitude, 
##D 			alpha ~ Orient + Involv, 
##D 			beta ~ Involv, 
##D 			data = attitudes, start=attitudeStartingValues) 
## End(Not run)
## maybe str(attitudeStartingValues) ; plot(attitudeStartingValues) ...



