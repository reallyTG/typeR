library(CDM)


### Name: IRT.jackknife
### Title: Jackknifing an Item Response Model
### Aliases: IRT.jackknife IRT.jackknife.gdina coef.IRT.jackknife
###   vcov.IRT.jackknife IRT.derivedParameters
### Keywords: Jackknife

### ** Examples

## Not run: 
##D library(BIFIEsurvey)
##D 
##D #############################################################################
##D # EXAMPLE 1: Multiple group DINA model with TIMSS data | Cluster sample
##D #############################################################################
##D 
##D data(data.timss11.G4.AUT.part, package="CDM")
##D 
##D dat <- data.timss11.G4.AUT.part$data
##D q.matrix <- data.timss11.G4.AUT.part$q.matrix2
##D # extract items
##D items <- paste(q.matrix$item)
##D 
##D # generate replicate design
##D rdes <- CDM::IRT.repDesign( data=dat,  wgt="TOTWGT", jktype="JK_TIMSS",
##D                    jkzone="JKCZONE", jkrep="JKCREP" )
##D 
##D #--- Model 1: fit multiple group GDINA model
##D mod1 <- CDM::gdina( dat[,items], q.matrix=q.matrix[,-1],
##D             weights=dat$TOTWGT, group=dat$female +1  )
##D # jackknife Model 1
##D jmod1 <- CDM::IRT.jackknife( object=mod1, repDesign=rdes )
##D summary(jmod1)
##D coef(jmod1)
##D vcov(jmod1)
##D 
##D #############################################################################
##D # EXAMPLE 2: DINA model | Simple random sampling
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D dat <- sim.dina
##D q.matrix <- sim.qmatrix
##D 
##D # generate replicate design with 50 jackknife zones (50 random groups)
##D rdes <- CDM::IRT.repDesign( data=dat,  jktype="JK_RANDOM", ngr=50 )
##D 
##D #--- Model 1: DINA model
##D mod1 <- CDM::gdina( dat, q.matrix=q.matrix, rule="DINA")
##D summary(mod1)
##D # jackknife DINA model
##D jmod1 <- CDM::IRT.jackknife( object=mod1, repDesign=rdes )
##D summary(jmod1)
##D 
##D #--- Model 2: DINO model
##D mod2 <- CDM::gdina( dat, q.matrix=q.matrix, rule="DINO")
##D summary(mod2)
##D # jackknife DINA model
##D jmod2 <- CDM::IRT.jackknife( object=mod2, repDesign=rdes )
##D summary(jmod2)
##D IRT.compareModels( mod1, mod2 )
##D 
##D # statistical inference for derived parameters
##D derived.parameters <- list( "skill1"=~ 0 + I(prob_skillV1_lev1_group1),
##D     "skilldiff12"=~ 0 + I( prob_skillV2_lev1_group1 - prob_skillV1_lev1_group1 ),
##D     "skilldiff13"=~ 0 + I( prob_skillV3_lev1_group1 - prob_skillV1_lev1_group1 )
##D                     )
##D jmod2a <- CDM::IRT.derivedParameters( jmod2, derived.parameters=derived.parameters )
##D summary(jmod2a)
##D coef(jmod2a)
## End(Not run)



