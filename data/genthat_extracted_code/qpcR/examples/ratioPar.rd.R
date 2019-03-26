library(qpcR)


### Name: ratioPar
### Title: Calculation of ratios in a batch format from external PCR
###   parameters
### Aliases: ratioPar
### Keywords: nonlinear

### ** Examples

## One control sample, two treatment samples, 
## one gene-of-interest, two reference genes, 
## two replicates each. Replicates are averaged,
## but reference genes not, so that we have 4 ratios.
GROUP1 <- c("r1c1", "r1c1", "r2c1", "r2c1", "g1c1", "g1c1",
           "r1s1", "r1s1", "r1s2", "r1s2", "r2s1", "r2s1",
           "r2s2", "r2s2", "g1s1", "g1s1", "g1s2", "g1s2") 
EFF1 <- c(1.96, 2.03, 1.60, 1.67, 1.91, 1.97, 1.53, 1.61, 1.87, 
          1.92, 1.52, 1.58, 1.84, 1.90, 1.49, 1.56, 1.83, 1.87)
CP1 <- c(15.44, 15.33, 14.84, 15.34, 18.89, 18.71, 18.13, 17.22, 22.06, 
        21.85, 21.03, 20.92, 25.34, 25.12, 25.00, 24.62, 28.39, 28.28)
RES1 <- ratioPar(group = GROUP1, effVec = EFF1, cpVec= CP1, refmean = FALSE)


## Not run: 
##D ## Same as above, but now we average the two
##D ## reference genes, so that we have 2 ratios.
##D RES2 <- ratioPar(group = GROUP1, effVec = EFF1, cpVec= CP1, refmean = TRUE)
##D 
##D ## Two control samples, one treatment sample, 
##D ## one gene-of-interest, one reference gene, 
##D ## no replicates. Reference gene has efficiency = 1.8,
##D ## gene-of-interest has efficiency = 1.9.
##D GROUP3 <- c("r1c1", "r1c2", "g1c1", "g1c2", 
##D             "r1s1", "g1s1") 
##D EFF3 <- c(1.8, 1.8, 1.9, 1.9, 1.8, 1.9)
##D CP3 <- c(17.25, 17.38, 22.52, 23.18, 21.42, 19.83)
##D RES3 <- ratioPar(group = GROUP3, effVec = EFF3, cpVec= CP3, refmean = TRUE)
##D                    
##D ## One control sample, one treatment sample, 
##D ## three genes-of-interest, no reference gene, 
##D ## three replicates. Using efficiency from sigmoidal model. 
##D GROUP4 <- c("g1c1", "g1c1", "g1c1", "g2c1", "g2c1", "g2c1", "g3c1", "g3c1", "g3c1",
##D             "g1s1", "g1s1", "g1s1", "g2s1", "g2s1", "g2s1", "g3s1", "g3s1", "g3s1")
##D EFF4 <- c(1.79, 1.71, 1.83, 1.98, 1.85, 1.76, 1.76, 1.91, 1.84, 1.80, 1.79, 1.91,
##D           1.88, 1.79, 1.78, 1.89, 1.86, 1.81)
##D CP4 <- c(15.68, 15.84, 14.47, 14.96, 18.97, 19.04, 17.65, 16.76, 22.11, 22.03, 20.43, 
##D          20.36, 25.29, 25.29, 24.27, 23.99, 28.34, 28.38)
##D RES4 <- ratioPar(group = GROUP4, effVec = EFF4, cpVec= CP4, refmean = TRUE)
##D 
##D ## Compare to REST software using the data from the 
##D ## REST 2008 manual (http://rest.gene-quantification.info/)
##D cp.rc <- c(26.74, 26.85, 26.83, 26.68, 27.39, 27.03, 26.78, 27.32)
##D cp.rs <- c(26.77, 26.47, 27.03, 26.92, 26.97, 26.97, 26.07, 26.3, 26.14, 26.81)
##D cp.gc <- c(27.57, 27.61, 27.82, 27.12, 27.76, 27.74, 26.91, 27.49)
##D cp.gs <- c(24.54, 24.95, 24.57, 24.63, 24.66, 24.89, 24.71, 24.9, 24.26, 24.44)
##D eff.rc <- rep(1.97, 8)
##D eff.rs <- rep(1.97, 10)
##D eff.gc <- rep(2.01, 8)
##D eff.gs <- rep(2.01, 10)
##D CP5 <- c(cp.rc, cp.rs, cp.gc, cp.gs)
##D EFF5 <- c(eff.rc, eff.rs, eff.gc, eff.gs) 
##D GROUP5 <- rep(c("r1c1", "r1s1", "g1c1", "g1s1"), c(8, 10, 8, 10))
##D RES5 <- ratioPar(group = GROUP5, effVec = EFF5, cpVec = CP5)
##D RES5$resDat
## End(Not run)        



