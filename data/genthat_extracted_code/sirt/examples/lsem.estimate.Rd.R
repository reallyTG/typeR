library(sirt)


### Name: lsem.estimate
### Title: Local Structural Equation Models (LSEM)
### Aliases: lsem.estimate summary.lsem plot.lsem lsem.MGM.stepfunctions
### Keywords: LSEM

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: data.lsem01 | Age differentiation
##D #############################################################################
##D 
##D data(data.lsem01)
##D dat <- data.lsem01
##D 
##D # specify lavaan model
##D lavmodel <- "
##D         F=~ v1+v2+v3+v4+v5
##D         F ~~ 1*F"
##D 
##D # define grid of moderator variable age
##D moderator.grid <- seq(4,23,1)
##D 
##D #********************************
##D #*** Model 1: estimate LSEM with bandwidth 2
##D mod1 <- sirt::lsem.estimate( dat, moderator="age", moderator.grid=moderator.grid,
##D                lavmodel=lavmodel, h=2, std.lv=TRUE)
##D summary(mod1)
##D plot(mod1, parindex=1:5)
##D 
##D # perform permutation test for Model 1
##D pmod1 <- sirt::lsem.permutationTest( mod1, B=10 )
##D           # only for illustrative purposes the number of permutations B is set
##D           # to a low number of 10
##D summary(pmod1)
##D plot(pmod1, type="global")
##D 
##D #** estimate Model 1 based on sufficient statistics
##D mod1b <- sirt::lsem.estimate( dat, moderator="age", moderator.grid=moderator.grid,
##D                lavmodel=lavmodel, h=2, std.lv=TRUE, sufficient_statistics=TRUE )
##D summary(mod1b)
##D 
##D #********************************
##D #*** Model 2: estimate multiple group model with 4 age groups
##D 
##D # define breaks for age groups
##D moderator.grid <- seq( 3.5, 23.5, len=5) # 4 groups
##D # estimate model
##D mod2 <- sirt::lsem.estimate( dat, moderator="age", moderator.grid=moderator.grid,
##D            lavmodel=lavmodel, type="MGM", std.lv=TRUE)
##D summary(mod2)
##D 
##D # output step functions
##D smod2 <- sirt::lsem.MGM.stepfunctions( object=mod2, moderator.grid=seq(4,23,1) )
##D str(smod2)
##D 
##D #********************************
##D #*** Model 3: define standardized loadings as derived variables
##D 
##D # specify lavaan model
##D lavmodel <- "
##D         F=~ a1*v1+a2*v2+a3*v3+a4*v4
##D         v1 ~~ s1*v1
##D         v2 ~~ s2*v2
##D         v3 ~~ s3*v3
##D         v4 ~~ s4*v4
##D         F ~~ 1*F
##D         # standardized loadings
##D         l1 :=a1 / sqrt(a1^2 + s1 )
##D         l2 :=a2 / sqrt(a2^2 + s2 )
##D         l3 :=a3 / sqrt(a3^2 + s3 )
##D         l4 :=a4 / sqrt(a4^2 + s4 )
##D         "
##D # estimate model
##D mod3 <- sirt::lsem.estimate( dat, moderator="age", moderator.grid=moderator.grid,
##D                lavmodel=lavmodel, h=2, std.lv=TRUE)
##D summary(mod3)
##D plot(mod3)
##D 
##D #********************************
##D #*** Model 4: estimate LSEM and automatically include standardized solutions
##D 
##D lavmodel <- "
##D         F=~ 1*v1+v2+v3+v4
##D         F ~~ F"
##D mod4 <- sirt::lsem.estimate( dat, moderator="age", moderator.grid=moderator.grid,
##D                lavmodel=lavmodel, h=2, standardized=TRUE)
##D summary(mod4)
##D # permutation test
##D pmod1 <- sirt::lsem.permutationTest( mod4, B=3 )
## End(Not run)



