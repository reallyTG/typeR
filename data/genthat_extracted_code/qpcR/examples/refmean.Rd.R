library(qpcR)


### Name: refmean
### Title: Averaging of multiple reference genes
### Aliases: refmean
### Keywords: nonlinear

### ** Examples

## Not run: 
##D ## Replacing the reference gene values by
##D ## averaged ones in the original data.
##D ## => RES1 is new dataset.
##D ## => GROUP1_mod in global environment is
##D ## new labeling vector.
##D DAT1 <- pcrbatch(reps, fluo = 2:19, model = l5)
##D GROUP1 <- c("r1c1", "r1c1", "r2c1", "r2c1", "g1c1", "g1c1",
##D            "r1s1", "r1s1", "r1s2", "r1s2", "r2s1", "r2s1",
##D            "r2s2", "r2s2", "g1s1", "g1s1", "g1s2", "g1s2") 
##D RES1 <- refmean(DAT1, GROUP1, which.eff = "sig", which.cp = "cpD2")
##D 
##D ## Using three reference genes without replicates
##D ## and then 'ratiobatch'.
##D ## This can also be called in 'ratiobatch' directly
##D ## with parameter 'refmean = TRUE'. See there.
##D ## In this example, already averaged dataset and 
##D ## new labeling vector are supplied to 'ratiobatch', 
##D ## so one has to set 'refmean = FALSE'.
##D DAT2 <- pcrbatch(reps, fluo = 2:9, model = l5)
##D GROUP2 <- c("r1c1", "r2c1", "r3c1", "g1c1", "r1s1", "r2s1", "r3s1", "g1s1" ) 
##D RES2 <- refmean(DAT2, GROUP2, which.eff = "sig", which.cp = "cpD2")
##D ratiobatch(RES2, GROUP2_mod, refmean = FALSE)
##D 
##D ## Comparison between 'refmean' ct-value arithmetic averaging
##D ## and 'geNorm' relative quantities geometric averaging
##D ## using data from the geNorm manual (2008), page 6.
##D ## We will use HK1-HK3 as in the manual (no replicates).
##D ## First we create a 'pcrbatch' dataset and then 
##D ## override the ct values with those of the manual and all
##D ## efficiencies with E = 2. Sample A is considered as control sample.
##D DAT3 <- pcrbatch(reps, fluo = 2:17, model = l5)
##D DAT3[8, -1] <- c(32.10, 27.00, 34.90, 23.00,
##D                  33.30, 28.40, 36.10, 24.20,
##D                  31.00, 27.50, 34.00, 26.35,
##D                  30.50, 28.20, 33.00, 25.45)
##D DAT3[1, -1] <- 2
##D GROUP3 <- c("r1c1", "r2c1", "r3c1", "g1c1",
##D             "r1s1", "r2s1", "r3s1", "g1s1",
##D             "r1s2", "r2s2", "r3s2", "g1s2",
##D             "r1s3", "r2s3", "r3s3", "g1s3")
##D RES3 <- refmean(DAT3, GROUP3, which.eff = "sig", which.cp = "cpD2")
##D ratiobatch(RES3, GROUP3_mod, which.cp = "cpD2",
##D            which.eff = "sig", refmean = FALSE)
##D ## Results:
##D ## r1c1:g1c1:r1s1:g1s1  refmean 1.0497
##D ##                      geNorm 1.0472 (2.351/2.245)
##D ## r1c1:g1c1:r1s2:g1s2  refmean 0.0693
##D ##                      geNorm 0.0695 (0.156/2.245)
##D ## r1c1:g1c1:r1s3:g1s3  refmean 0.1081
##D ##                      geNorm 0.1074 (0.241/2.245)
##D ## Slight differences are due to rounding.
## End(Not run)



