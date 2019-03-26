library(qpcR)


### Name: ratiobatch
### Title: Calculation of ratios in a batch format for multiple
###   genes/samples
### Aliases: ratiobatch
### Keywords: nonlinear

### ** Examples

## Not run: 
##D ## One reference gene, one gene of interest,
##D ## one control and one treatment sample with 
##D ## 4 replicates each => 1 x Ratio = 1.
##D DAT1 <- pcrbatch(reps, fluo = c(2:9, 2:9), model = l5)
##D GROUP1 <- c("g1c1", "g1c1", "g1c1", "g1c1",
##D             "g1s1", "g1s1", "g1s1", "g1s1", 
##D             "r1c1", "r1c1", "r1c1", "r1c1",
##D             "r1s1", "r1s1", "r1s1", "r1s1") 
##D ratiobatch(DAT1, GROUP1, refmean = FALSE)  
##D 
##D ## One reference gene, one gene of interest,
##D ## two control and two treatment samples with 
##D ## 2 replicates each => 4 x Ratio = 1.
##D DAT2 <- pcrbatch(reps, fluo = c(2:9, 2:9), model = l5)
##D GROUP2 <- c("g1c1", "g1c1", "g1c2", "g1c2",
##D             "g1s1", "g1s1", "g1s2", "g1s2", 
##D             "r1c1", "r1c1", "r1c2", "r1c2",
##D             "r1s1", "r1s1", "r1s2", "r1s2") 
##D ratiobatch(DAT2, GROUP2, refmean = FALSE)
##D 
##D ## Two reference genes, one gene of interest,
##D ## one control and one treatment samples with 
##D ## 4 replicates each => 2 x Ratio = 1.
##D DAT3 <- pcrbatch(reps, fluo = c(2:9, 2:9, 2:9), model = l5)
##D GROUP3 <- c("g1c1", "g1c1", "g1c1", "g1c1",
##D             "g1s1", "g1s1", "g1s1", "g1s1", 
##D             "r1c1", "r1c1", "r1c1", "r1c1",
##D             "r1s1", "r1s1", "r1s1", "r1s1",
##D             "r2c1", "r2c1", "r2c1", "r2c1",
##D             "r2s1", "r2s1", "r2s1", "r2s1") 
##D ratiobatch(DAT3, GROUP3, refmean = FALSE)
##D 
##D ## Two reference genes, one gene of interest,
##D ## one control and one treatment samples with 
##D ## 4 replicates each.
##D ## Reference genes are averaged => 1 x Ratio = 1.
##D DAT4 <- pcrbatch(reps, fluo = c(2:9, 2:9, 2:9), model = l5)
##D GROUP4 <- c("g1c1", "g1c1", "g1c1", "g1c1",
##D             "g1s1", "g1s1", "g1s1", "g1s1", 
##D             "r1c1", "r1c1", "r1c1", "r1c1",
##D             "r1s1", "r1s1", "r1s1", "r1s1",
##D             "r2c1", "r2c1", "r2c1", "r2c1",
##D             "r2s1", "r2s1", "r2s1", "r2s1") 
##D ratiobatch(DAT4, GROUP4, refmean = TRUE)
##D 
##D ## Same as above, but use same efficiency E = 2.         
##D ratiobatch(DAT4, GROUP4, which.eff = 2) 
##D                    
##D ## No reference genes, two genes-of-interest, 
##D ## two control and two treatment samples with
##D ## 2 replicates each, efficiency from sigmoidal model. 
##D DAT6 <- pcrbatch(reps, fluo = 2:17, model = l5)
##D GROUP6 <- c("g1s1", "g1s1", "g1s2", "g1s2",
##D             "g2s1", "g2s1", "g2s2", "g2s2",
##D             "g1c1", "g1c1", "g1c2", "g1c2",
##D             "g2c1", "g2c1", "g2c2", "g2c2")            
##D ratiobatch(DAT6, GROUP6, which.eff = "sig")
##D 
##D ## Same as above, but using a mechanistic model (mak3).
##D ## BEWARE: type.eff must be "individual"!
##D DAT7 <- pcrbatch(reps, fluo = 2:17, model = l5,
##D                  methods = c("sigfit", "mak3"))
##D GROUP7 <- c("g1s1", "g1s1", "g1s2", "g1s2",
##D             "g2s1", "g2s1", "g2s2", "g2s2",
##D             "g1c1", "g1c1", "g1c2", "g1c2",
##D             "g2c1", "g2c1", "g2c2", "g2c2")
##D ratiobatch(DAT7, GROUP7, which.eff = "mak", 
##D            type.eff = "individual")
##D 
##D ## Using external efficiencies from a 
##D ## calibration curve. Can be supplied by the
##D ## user from external calibration (or likewise),
##D ## but in this example acquired by function 'calib'.
##D ml1 <- modlist(reps, fluo = 2:25, model = l5)
##D DIL <- rep(10^(5:0), each = 4) 
##D EFF <- calib(refcurve = ml1, dil = DIL)$eff   
##D DAT8 <- pcrbatch(ml1)
##D GROUP8 <- c(rep("g1s1", 4), rep("g1s2", 4),
##D             rep("g1s3", 4), rep("g1s4", 4), 
##D             rep("g1s5", 4), rep("g1c1", 4)) 
##D ratiobatch(DAT8, GROUP8, which.eff = EFF)
## End(Not run)



