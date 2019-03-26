library(qpcR)


### Name: ratiocalc
### Title: Calculation of ratios from qPCR runs with/without reference
###   genes
### Aliases: ratiocalc
### Keywords: nonlinear

### ** Examples

## Only treatment sample and control,
## no reference gene, 4 replicates each.
## Individual efficiencies for error calculation. 
DAT1 <- pcrbatch(reps, fluo = 2:9, model = l4)
GROUP1 <- c("gs", "gs", "gs", "gs", "gc", "gc", "gc", "gc")
RES1 <- ratiocalc(DAT1, group = GROUP1, which.eff = "sli",
                 type.eff = "individual", which.cp = "cpD2")       
RES1$summary

## Not run: 
##D ## Gets even better using averaged efficiencies 
##D ## over all replicates.
##D ## p-value indicates significant upregulation in 
##D ## comparison to randomly reallocated 
##D ## samples (similar to REST software)
##D RES2 <- ratiocalc(DAT1, GROUP1, which.eff = "sli", 
##D                   type.eff = "mean.single", which.cp = "cpD2")                 
##D RES2$summary    
##D 
##D ## Using reference data.
##D ## Toy example is same data as above
##D ## but replicated as reference such
##D ## that the ratio should be 1.
##D DAT3 <- pcrbatch(reps, fluo = c(2:9, 2:9), model = l4)
##D GROUP3 <- c("gs", "gs", "gs", "gs", 
##D             "gc", "gc", "gc", "gc",
##D             "rs", "rs", "rs", "rs",
##D             "rc", "rc", "rc", "rc")
##D RES3 <- ratiocalc(DAT3, GROUP3, which.eff = "sli", 
##D                   type.eff = "mean.single", which.cp = "cpD2")                  
##D RES3$summary
##D 
##D ## Using one of the mechanistic models
##D ## => ratios are calculated from the replicate
##D ## D0 values, without reference genes.
##D DAT4 <- pcrbatch(reps, fluo = 2:9, 
##D                  methods = c("sigfit", "sliwin", "mak3"))
##D GROUP4 <- c("gs", "gs", "gs", "gs", "gc", "gc", "gc", "gc")
##D RES4 <- ratiocalc(DAT4, GROUP4, which.eff = "mak")
##D RES4$summary
##D 
##D ## Example without replicates 
##D ## => no Monte-Carlo simulations
##D ## and hence no plots.
##D DAT5 <- pcrbatch(reps, fluo = 2:5, model = l4)
##D GROUP5 <- c("gs", "gc", "rs", "rc")
##D RES5 <- ratiocalc(DAT5, GROUP5, which.eff = "sli", 
##D                   type.eff = "individual", which.cp = "cpD2")
##D RES5$summary
##D 
##D ## Using external efficiencies.
##D DAT6 <- pcrbatch(reps, fluo = 2:9, model = l5)
##D GROUP6 <- c("gs", "gs", "gs", "gs", "gc", "gc", "gc", "gc")
##D EFF6 <- rep(c(1.72, 1.76), c(4, 4)) 
##D RES6 <- ratiocalc(DAT6, GROUP6, which.eff = EFF6, 
##D                  type.eff = "individual", which.cp = "cpD2")       
##D RES6$summary
##D 
##D ## Using external efficiencies AND
##D ## external threshold cycles.
##D DAT7 <- pcrbatch(reps, fluo = 2:9, model = l5)
##D GROUP7 <- c("gs", "gs", "gs", "gs", "gc", "gc", "gc", "gc")
##D EFF7 <- rep(c(1.72, 1.76), c(4, 4))
##D CP7 <- c(15.44, 15.33, 14.84, 15.34, 18.89, 18.71, 18.13, 17.22)
##D RES7 <- ratiocalc(DAT7, GROUP7, which.eff = EFF7, 
##D                  type.eff = "individual", which.cp = CP7)       
##D RES7$summary
##D 
##D ## Compare 'ratiocalc' to REST software
##D ## using the data from the REST 2008
##D ## manual (http://rest.gene-quantification.info/).
##D ## We supply the threshold cycles/efficiencies from the 
##D ## manual as external data to 'dummy' pcrbatch data.
##D ## BETTER: use 'ratioPar' function!
##D cp.rc <- c(26.74, 26.85, 26.83, 26.68, 27.39, 27.03, 26.78, 27.32)
##D cp.rs <- c(26.77, 26.47, 27.03, 26.92, 26.97, 26.97, 26.07, 26.3, 26.14, 26.81)
##D cp.gc <- c(27.57, 27.61, 27.82, 27.12, 27.76, 27.74, 26.91, 27.49)
##D cp.gs <- c(24.54, 24.95, 24.57, 24.63, 24.66, 24.89, 24.71, 24.9, 24.26, 24.44)
##D eff.rc <- rep(1.97, 8)
##D eff.rs <- rep(1.97, 10)
##D eff.gc <- rep(2.01, 8)
##D eff.gs <- rep(2.01, 10)
##D CP8 <- c(cp.rc, cp.rs, cp.gc, cp.gs)
##D EFF8 <- c(eff.rc, eff.rs, eff.gc, eff.gs) 
##D DAT8 <- pcrbatch(rutledge, 1, 2:37, model = l4)
##D GROUP8 <- rep(c("rc", "rs", "gc", "gs"), c(8, 10, 8, 10))
##D RES8 <- ratiocalc(DAT8, GROUP8, which.eff = EFF8, which.cp = CP8)
##D RES8$summary
##D ## => Confidence interval: 2.983/9.996
##D ## REST 2008 manual, page 10: 2.983/9.996
## End(Not run)



