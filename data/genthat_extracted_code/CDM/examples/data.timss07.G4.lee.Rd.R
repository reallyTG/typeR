library(CDM)


### Name: data.timss07.G4.lee
### Title: TIMSS 2007 Mathematics 4th Grade (Lee et al., 2011)
### Aliases: data.timss07.G4.lee data.timss07.G4.py
###   data.timss07.G4.Qdomains
### Keywords: datasets

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: DINA model Lee et al. (2011) - 15 skills
##D #############################################################################
##D 
##D data(data.timss07.G4.lee, package="CDM")
##D dat <- data.timss07.G4.lee$data
##D q.matrix <- data.timss07.G4.lee$q.matrix
##D # extract items
##D items <- grep( "M0", colnames(dat), value=TRUE )
##D 
##D #*** Model 1: estimate DINA model
##D mod1 <- CDM::din( dat[,items], q.matrix )
##D summary(mod1)
##D 
##D #############################################################################
##D # EXAMPLE 2: DINA models Park and Lee (2014) - 7 skills and 3 skills
##D #############################################################################
##D 
##D data(data.timss07.G4.lee, package="CDM")
##D data(data.timss07.G4.py, package="CDM")
##D data(data.timss07.G4.Qdomains, package="CDM")
##D 
##D dat <- data.timss07.G4.lee$data
##D q.matrix <- data.timss07.G4.py$q.matrix
##D items <- rownames(q.matrix)
##D 
##D #*** Model 1: estimate DINA model
##D mod1 <- CDM::din( dat[,items], q.matrix )
##D summary(mod1)
##D 
##D #*** Model 2: estimate DINA model with Q-matrix defined by domains
##D Q <- data.timss07.G4.Qdomains
##D mod2 <- CDM::din( dat[,items], q.matrix=Q )
##D summary(mod2)
## End(Not run)



