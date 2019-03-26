library(sensitivitymult)


### Name: amplify
### Title: Amplification of sensitivity analysis in observational studies.
### Aliases: amplify

### ** Examples

	data(teeth)
	attach(teeth)
# The following calculation reproduces the comparison
# in expression (5.1) of Rosenbaum (2016, p. 1464)
comparison(cbind(either4low,either4up),smoker,
   mset,c(.714,.286),gamma=2.2,trim=2.5,Scheffe=TRUE)
# The parameter gamma=2.2 is given alternative interpretations
# in Rosenbaum (2016, p. 1465) as follows:
amplify(2.2,c(3,4,5,6,7))
  detach(teeth)



