library(sirt)


### Name: rasch.evm.pcm
### Title: Estimation of the Partial Credit Model using the Eigenvector
###   Method
### Aliases: rasch.evm.pcm summary.rasch.evm.pcm coef.rasch.evm.pcm
###   vcov.rasch.evm.pcm
### Keywords: Eigenvector method Pairwise estimation summary coef vcov

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset Liking for Science
#############################################################################

data(data.liking.science)
dat <- data.liking.science

# estimate partial credit model using 10 Jackknife units
mod1 <- sirt::rasch.evm.pcm( dat, jackunits=10 )
summary(mod1)

## Not run: 
##D # compare results with TAM
##D library(TAM)
##D mod2 <- TAM::tam.mml( dat )
##D r1 <- mod2$xsi$xsi
##D r1 <- r1 - mean(r1)
##D # item parameters are similar
##D dfr <- data.frame( "b_TAM"=r1, mod1$item[,c( "est","est_jack") ] )
##D round( dfr, 3 )
##D   ##      b_TAM    est est_jack
##D   ##  1  -2.496 -2.599   -2.511
##D   ##  2   0.687  0.824    1.030
##D   ##  3  -0.871 -0.975   -0.943
##D   ##  4  -0.360 -0.320   -0.131
##D   ##  5  -0.833 -0.970   -0.856
##D   ##  6   1.298  1.617    1.444
##D   ##  7   0.476  0.465    0.646
##D   ##  8   2.808  3.194    3.439
##D   ##  9   1.611  1.460    1.433
##D   ##  10  2.396  1.230    1.095
##D   ##  [...]
##D 
##D # partial credit model in eRm package
##D miceadds::library_install("eRm")
##D mod3 <- eRm::PCM(X=dat)
##D summary(mod3)
##D eRm::plotINFO(mod3)      # plot item and test information
##D eRm::plotICC(mod3)       # plot ICCs
##D eRm::plotPImap(mod3)     # plot person-item maps
##D 
##D #############################################################################
##D # EXAMPLE 2: Garner and Engelhard (2002) toy example dichotomous data
##D #############################################################################
##D 
##D dat <- scan()
##D    1 0 1 1   1 1 0 0   1 0 0 0   0 1 1 1   1 1 1 0
##D    1 1 0 1   1 1 1 1   1 0 1 0   1 1 1 1   1 1 0 0
##D 
##D dat <- matrix( dat, 10, 4, byrow=TRUE)
##D colnames(dat) <- paste0("I", 1:4 )
##D 
##D # estimate Rasch model with no jackknifing
##D mod1 <- sirt::rasch.evm.pcm( dat, jackunits=0 )
##D 
##D # paired comparison matrix
##D mod1$B
##D   ##          I1_Cat1 I2_Cat1 I3_Cat1 I4_Cat1
##D   ##  I1_Cat1       0       3       4       5
##D   ##  I2_Cat1       1       0       3       3
##D   ##  I3_Cat1       1       2       0       2
##D   ##  I4_Cat1       1       1       1       0
##D 
##D #############################################################################
##D # EXAMPLE 3: Garner and Engelhard (2002) toy example polytomous data
##D #############################################################################
##D 
##D dat <- scan()
##D    2 2 1 1 1   2 1 2 0 0   1 0 0 0 0   0 1 1 2 0   1 2 2 1 1
##D    2 2 0 2 1   2 2 1 1 0   1 0 1 0 0   2 1 2 2 2   2 1 0 0 1
##D 
##D dat <- matrix( dat, 10, 5, byrow=TRUE)
##D colnames(dat) <- paste0("I", 1:5 )
##D 
##D # estimate partial credit model with no jackknifing
##D mod1 <- sirt::rasch.evm.pcm( dat, jackunits=0, powB=3 )
##D 
##D # paired comparison matrix
##D mod1$B
##D   ##          I1_Cat1 I1_Cat2 I2_Cat1 I2_Cat2 I3_Cat1 I3_Cat2 I4_Cat1 I4_Cat2 I5_Cat1 I5_Cat2
##D   ##  I1_Cat1       0       0       2       0       1       1       2       1       2       1
##D   ##  I1_Cat2       0       0       0       3       2       2       2       2       2       3
##D   ##  I2_Cat1       1       0       0       0       1       1       2       0       2       1
##D   ##  I2_Cat2       0       1       0       0       1       2       0       3       1       3
##D   ##  I3_Cat1       1       1       1       1       0       0       1       2       3       1
##D   ##  I3_Cat2       0       1       0       2       0       0       1       1       1       1
##D   ##  I4_Cat1       0       1       0       0       0       2       0       0       1       2
##D   ##  I4_Cat2       1       0       0       2       1       1       0       0       1       1
##D   ##  I5_Cat1       0       1       0       1       2       1       1       2       0       0
##D   ##  I5_Cat2       0       0       0       1       0       0       0       0       0       0
##D 
##D #############################################################################
##D # EXAMPLE 4: Partial credit model for dataset data.mg from CDM package
##D #############################################################################
##D 
##D library(CDM)
##D data(data.mg,package="CDM")
##D dat <- data.mg[, paste0("I",1:11) ]
##D 
##D #*** Model 1: estimate partial credit model
##D mod1 <- sirt::rasch.evm.pcm( dat )
##D # item parameters
##D round( mod1$b, 3 )
##D   ##        Cat1   Cat2  Cat3
##D   ##  I1  -1.537     NA    NA
##D   ##  I2  -2.360     NA    NA
##D   ##  I3  -0.574     NA    NA
##D   ##  I4  -0.971 -2.086    NA
##D   ##  I5  -0.104  0.201    NA
##D   ##  I6   0.470  0.806    NA
##D   ##  I7  -1.027  0.756 1.969
##D   ##  I8   0.897     NA    NA
##D   ##  I9   0.766     NA    NA
##D   ##  I10  0.069     NA    NA
##D   ##  I11 -1.122  1.159 2.689
##D 
##D #*** Model 2: estimate PCM with pairwise package
##D miceadds::library_install("pairwise")
##D mod2 <- pairwise::pair(daten=dat)
##D summary(mod2)
##D plot(mod2)
##D # compute standard errors
##D semod2 <- pairwise::pairSE(daten=dat,  nsample=20)
##D semod2
##D 
##D #############################################################################
##D # EXAMPLE 5: Differential item functioning for dataset data.mg
##D #############################################################################
##D 
##D library(CDM)
##D data(data.mg,package="CDM")
##D dat <- data.mg[ data.mg$group %in% c(2,3,11), ]
##D # define items
##D items <- paste0("I",1:11)
##D # estimate model
##D mod1 <- sirt::rasch.evm.pcm( dat[,items], weights=dat$weight, group=dat$group )
##D summary(mod1)
##D 
##D #############################################################################
##D # EXAMPLE 6: Differential item functioning for Rasch model
##D #############################################################################
##D 
##D # simulate some data
##D set.seed(9776)
##D N <- 1000    # number of persons
##D I <- 10        # number of items
##D # simulate data for first group
##D b <- seq(-1.5,1.5,len=I)
##D dat1 <- sirt::sim.raschtype( stats::rnorm(N), b )
##D # simulate data for second group
##D b1 <- b
##D b1[4] <- b1[4] + .5 # introduce DIF for fourth item
##D dat2 <- sirt::sim.raschtype( stats::rnorm(N,mean=.3), b1 )
##D dat <- rbind(dat1, dat2 )
##D group <- rep( 1:2, each=N )
##D # estimate model
##D mod1 <- sirt::rasch.evm.pcm( dat, group=group )
##D summary(mod1)
## End(Not run)



