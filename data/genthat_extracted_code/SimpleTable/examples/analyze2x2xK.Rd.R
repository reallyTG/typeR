library(SimpleTable)


### Name: analyze2x2xK
### Title: Analyze 2 x 2 x K Table in the Presence of Unmeasured
###   Confounding
### Aliases: analyze2x2xK
### Keywords: models

### ** Examples

## Not run: 
##D ## Example from Quinn (2008)
##D ## (original data from Oliver and Wolfinger. 1999. 
##D ##   ``Jury Aversion and Voter Registration.'' 
##D ##     American Political Science Review. 93: 147-152.)
##D ##
##D ##
##D ##             W=0
##D ##          Y=0   Y=1
##D ##  X=0      1     21
##D ##  X=1     10     93
##D ##
##D ##
##D ##             W=1
##D ##          Y=0   Y=1
##D ##  X=0      5     32
##D ##  X=1     27     92
##D ##
##D ##
##D ##             W=2
##D ##          Y=0   Y=1
##D ##  X=0      4     44
##D ##  X=1     52    186
##D ##
##D ##
##D ##             W=3
##D ##          Y=0   Y=1
##D ##  X=0      7     20
##D ##  X=1     19     47
##D ##
##D ##
##D ##             W=4
##D ##          Y=0   Y=1
##D ##  X=0      2     26
##D ##  X=1      6     55
##D ##
##D 
##D 
##D ## a prior belief in an essentially negative monotonic treatment effect 
##D ## with the largest effects among those for whom W <= 2
##D 
##D S.mono.0 <- analyze2x2(C00=1, C01=21, C10=10, C11=93, 
##D                        a00=.25, a01=.25, a10=.25, a11=.25,
##D                        b00=0.02, c00=10, b01=25, c01=3, 
##D                        b10=3, c10=25, b11=10, c11=0.02)
##D 
##D S.mono.1 <- analyze2x2(C00=5, C01=32, C10=27, C11=92, 
##D                        a00=.25, a01=.25, a10=.25, a11=.25,
##D                        b00=0.02, c00=10, b01=25, c01=3, 
##D                        b10=3, c10=25, b11=10, c11=0.02)
##D 
##D S.mono.2 <- analyze2x2(C00=4, C01=44, C10=52, C11=186, 
##D                        a00=.25, a01=.25, a10=.25, a11=.25,
##D                        b00=0.02, c00=10, b01=25, c01=3, 
##D                        b10=3, c10=25, b11=10, c11=0.02)
##D 
##D S.mono.3 <- analyze2x2(C00=7, C01=20, C10=19, C11=47, 
##D                        a00=.25, a01=.25, a10=.25, a11=.25,
##D                        b00=0.02, c00=10, b01=15, c01=1, 
##D                        b10=1, c10=15, b11=10, c11=0.02)
##D 
##D S.mono.4 <- analyze2x2(C00=2, C01=26, C10=6, C11=55, 
##D                        a00=.25, a01=.25, a10=.25, a11=.25,
##D                        b00=0.02, c00=10, b01=15, c01=1, 
##D                        b10=1, c10=15, b11=10, c11=0.02)
##D 
##D S.mono.all <- analyze2x2xK(list(S.mono.0, S.mono.1, S.mono.2, 
##D 	                        S.mono.3, S.mono.4), 
##D                            c(0.2, 0.2, 0.2, 0.2, 0.2))
##D 
##D summary(S.mono.all)
##D plot(S.mono.all)
##D 
## End(Not run)



