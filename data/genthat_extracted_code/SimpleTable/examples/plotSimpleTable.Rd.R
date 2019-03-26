library(SimpleTable)


### Name: plot.SimpleTable
### Title: Summary plots of SimpleTable objects.
### Aliases: plot.SimpleTable
### Keywords: methods hplot

### ** Examples

## Not run: 
##D ## Example from Quinn (2008)
##D ## (original data from Oliver and Wolfinger. 1999. 
##D ##   ``Jury Aversion and Voter Registration.'' 
##D ##     American Political Science Review. 93: 147-152.)
##D ##
##D ##        Y=0       Y=1
##D ## X=0    19        143
##D ## X=1    114       473
##D ##
##D 
##D ## a prior belief in an essentially negative monotonic treatment effect 
##D S.mono <- analyze2x2(C00=19, C01=143, C10=114, C11=473, 
##D                      a00=.25, a01=.25, a10=.25, a11=.25,
##D 		     b00=0.02, c00=10, b01=25, c01=3, 
##D                      b10=3, c10=25, b11=10, c11=0.02)
##D 
##D ## ATE (the default)
##D plot(S.mono)
##D 
##D ## ATC instead of ATE
##D plot(S.mono, estimand="ATC")
##D 
##D ## different colors
##D plot(S.mono, estimand="ATC", color1.pf="red", color2.pf="blue",
##D      color1.sens="gray", color2.sens="orange")
##D    
## End(Not run)



