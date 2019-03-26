library(CDM)


### Name: mcdina
### Title: Multiple Choice DINA Model
### Aliases: mcdina summary.mcdina print.mcdina
### Keywords: Multiple choice Multiple choice DINA model (MCDINA) DINA
###   summary print

### ** Examples

#############################################################################
# EXAMPLE 1: Multiple choice DINA model for data.cdm01 dataset
#############################################################################

data(data.cdm01, package="CDM")

dat <- data.cdm01$data
group <- data.cdm01$group
q.matrix <- data.cdm01$q.matrix

#*** Model 1: Single group model
mod1 <- CDM::mcdina( dat=dat, q.matrix=q.matrix )
summary(mod1)

#*** Model 2: Multiple group model with group-invariant item parameters
mod2 <- CDM::mcdina( dat=dat, q.matrix=q.matrix, group=group, itempars="jo")
summary(mod2)

## Not run: 
##D #*** Model 3: Multiple group model with group-specific item parameters
##D mod3 <- CDM::mcdina( dat=dat, q.matrix=q.matrix, group=group, itempars="gr")
##D summary(mod3)
##D 
##D #*** Model 4: Multiple group model with some group-specific item parameters
##D itempars <- rep("jo", ncol(dat))
##D itempars[ c( 2, 7, 9) ] <- "gr" # set items 2,7 and 9 group specific
##D mod4 <- CDM::mcdina( dat=dat, q.matrix=q.matrix, group=group, itempars=itempars)
##D summary(mod4)
##D 
##D #*** Model 5: Reduced skill space
##D 
##D # define skill classes
##D skillclasses <- scan(nlines=1)  # read only one line
##D     0 0 0    1 0 0    0 1 0    0 0 1    1 1 0     1 1 1
##D skillclasses <- matrix( skillclasses, ncol=3, byrow=TRUE )
##D mod5 <- CDM::mcdina( dat, q.matrix=q.matrix, group=group0,  skillclasses=skillclasses )
##D summary(mod5)
##D 
##D #*** Model 6: Reduced skill space with setting zero probabilities
##D #             for some latent classes
##D 
##D # set probabilities of classes P101 P011 (6th and 7th class) to zero
##D zeroprob.skillclasses <- c(6,7)
##D mod6 <- CDM::mcdina( dat, q.matrix, group=group, zeroprob.skillclasses=zeroprob.skillclasses )
##D summary(mod6)
##D 
##D #############################################################################
##D # EXAMPLE 2: Using the mcdina function for estimating the DINA model
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D # estimate the DINA model
##D mod <- CDM::mcdina( sim.dina, q.matrix=sim.qmatrix )
##D summary(mod)
##D 
##D #############################################################################
##D # EXAMPLE 3: MCDINA model with polytomous attributes
##D #############################################################################
##D 
##D data(data.cdm02, package="CDM")
##D dat <- data.cdm02$data
##D q.matrix <- data.cdm02$q.matrix
##D 
##D # estimate model with polytomous attribute B1
##D mod1 <- CDM::mcdina( dat, q.matrix=q.matrix )
##D summary(mod1)
## End(Not run)



