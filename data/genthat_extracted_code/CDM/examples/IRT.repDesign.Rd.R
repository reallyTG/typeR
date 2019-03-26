library(CDM)


### Name: IRT.repDesign
### Title: Generation of a Replicate Design for 'IRT.jackknife'
### Aliases: IRT.repDesign
### Keywords: Replication weights

### ** Examples

## Not run: 
##D # load the BIFIEsurvey package
##D library(BIFIEsurvey)
##D 
##D #############################################################################
##D # EXAMPLE 1: Design with Jackknife replicate weights in TIMSS
##D #############################################################################
##D 
##D data(data.timss11.G4.AUT, package="CDM")
##D dat <- CDM::data.timss11.G4.AUT$data
##D # generate design
##D rdes <- CDM::IRT.repDesign( data=dat,  wgt="TOTWGT", jktype="JK_TIMSS",
##D              jkzone="JKCZONE", jkrep="JKCREP" )
##D str(rdes)
##D 
##D #############################################################################
##D # EXAMPLE 2: Bootstrap resampling
##D #############################################################################
##D 
##D data(sim.qmatrix, package="CDM")
##D q.matrix <- CDM::sim.qmatrix
##D 
##D # simulate data according to the DINA model
##D dat <- CDM::sim.din(N=2000, q.matrix=q.matrix )$dat
##D 
##D # bootstrap with 300 random samples
##D rdes <- CDM::IRT.repDesign( data=dat, jktype="BOOT", Nboot=300 )
## End(Not run)



