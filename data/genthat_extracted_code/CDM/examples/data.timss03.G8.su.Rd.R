library(CDM)


### Name: data.timss03.G8.su
### Title: TIMSS 2003 Mathematics 8th Grade (Su et al., 2013)
### Aliases: data.timss03.G8.su
### Keywords: datasets

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Data Su et al. (2013)
##D #############################################################################
##D 
##D data(data.timss03.G8.su, package="CDM")
##D data <- data.timss03.G8.su$data[,-c(1,2)]
##D q.matrix <- data.timss03.G8.su$q.matrix
##D 
##D #*** Model 1: DINA model with complete skill space of 2^13=8192 skill classes
##D mod1 <- CDM::din( data, q.matrix )
##D 
##D #*** Model 2: Skill space approximation with 3000 skill classes instead of
##D #    2^13=8192 classes as in Model 1
##D ss2 <- CDM::skillspace.approximation( L=3000, K=ncol(q.matrix) )
##D mod2 <- CDM::din( data, q.matrix, skillclasses=ss2 )
##D 
##D #*** Model 3: DINA model with a hierarchical skill space
##D #   see Su et al. (2013): Fig. 6
##D B <- "S1 > S2 > S7 > S8
##D       S15 > S9
##D       S3 > S9
##D       S13 > S4 > S9
##D       S14 > S5 > S6 > S11"
##D # Note that S10 and S12 are not included in the dataset contained in this package
##D skill.names <- colnames(q.matrix)
##D ss3 <- CDM::skillspace.hierarchy(B=B, skill.names=skill.names)
##D # The reduced skill space "only" contains 325 skill classes
##D mod3 <- CDM::din( data, q.matrix, skillclasses=ss3$skillspace.reduced )
## End(Not run)



