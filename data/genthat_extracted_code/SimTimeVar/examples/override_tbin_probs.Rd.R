library(SimTimeVar)


### Name: override_tbin_probs
### Title: Override probabilities for time-varying binary variables
### Aliases: override_tbin_probs

### ** Examples

# make example subject means matrix for 1 static binary, 
#  1 time-varying binary, and 1 normal
#  50 subjects and 5 observations (latter plays into variance)
set.seed(451)
mus0 = mod.jointly.generate.binary.normal( no.rows = 50, no.bin = 2, no.nor = 2,
                                           prop.vec.bin = c( .5, .35 ),
                                           mean.vec.nor = c( .4, 100 ),
                                           var.nor = c( (0.4 * 0.6) / 5, 10 ),
                                           corr.vec = c(0.05, .08, 0, 0, -0.03, 0) )

# note that we have ever-users with non-zero propensities to be on drug: not okay
any( mus0[,1] == 0 & mus0[,3] != 0 )

# fix them
mus1 = override_tbin_probs( mus0, 1, 1 )

# all better!
any( mus1[,1] == 0 & mus1[,3] > 0.0001 )



