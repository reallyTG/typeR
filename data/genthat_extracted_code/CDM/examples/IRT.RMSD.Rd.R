library(CDM)


### Name: IRT.RMSD
### Title: Root Mean Square Deviation (RMSD) Item Fit Statistic
### Aliases: IRT.RMSD summary.IRT.RMSD IRT_RMSD_calc_rmsd

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: data.read | 1PL model in TAM
##D #############################################################################
##D 
##D data(data.read, package="sirt")
##D dat <- data.read
##D 
##D #*** Model 1: 1PL model
##D mod1 <- TAM::tam.mml( resp=dat )
##D summary(mod1)
##D 
##D # item fit statistics
##D imod1 <- CDM::IRT.RMSD(mod1)
##D summary(imod1)
##D 
##D #############################################################################
##D # EXAMPLE 2: data.math| RMSD and MD statistic for assessing DIF
##D #############################################################################
##D 
##D data(data.math, package="sirt")
##D dat <- data.math$data
##D items <- grep("M[A-Z]", colnames(dat), value=TRUE )
##D 
##D #-- fit multiple group Rasch model
##D mod <- TAM::tam.mml( dat[,items], group=dat$female )
##D summary(mod)
##D 
##D #-- fit statistics
##D rmod <- CDM::IRT.RMSD(mod)
##D summary(rmod)
##D 
##D #############################################################################
##D # EXAMPLE 3: RMSD statistic DINA model
##D #############################################################################
##D 
##D data(sim.dina)
##D data(sim.qmatrix)
##D dat <- sim.dina
##D Q <- sim.qmatrix
##D 
##D #-- fit DINA model
##D mod1 <- CDM::gdina( dat, q.matrix=Q, rule="DINA" )
##D summary(mod1)
##D 
##D #-- compute RMSD fit statistic
##D rmod1 <- CDM::IRT.RMSD(mod1)
##D summary(rmod1)
## End(Not run)



