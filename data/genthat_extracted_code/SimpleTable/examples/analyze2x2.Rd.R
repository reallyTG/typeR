library(SimpleTable)


### Name: analyze2x2
### Title: Analyze 2 x 2 Table in the Presence of Unmeasured Confounding
### Aliases: analyze2x2
### Keywords: models

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
##D ## uniform prior on the potential outcome distributions
##D S.unif <- analyze2x2(C00=19, C01=143, C10=114, C11=473, 
##D                      a00=.25, a01=.25, a10=.25, a11=.25,
##D                      b00=1, c00=1, b01=1, c01=1, 
##D                      b10=1, c10=1, b11=1, c11=1)
##D 
##D summary(S.unif)
##D plot(S.unif)
##D 
##D 
##D ## a prior belief in an essentially negative monotonic treatment effect 
##D S.mono <- analyze2x2(C00=19, C01=143, C10=114, C11=473, 
##D                      a00=.25, a01=.25, a10=.25, a11=.25,
##D 		     b00=0.02, c00=10, b01=25, c01=3, 
##D                      b10=3, c10=25, b11=10, c11=0.02)
##D 
##D summary(S.mono)
##D plot(S.mono)
## End(Not run)



