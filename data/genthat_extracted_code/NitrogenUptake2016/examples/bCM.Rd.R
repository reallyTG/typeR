library(NitrogenUptake2016)


### Name: bCM
### Title: Parameterize Box-Cox model for mass-height allometry (based on
###   Lu et al. 2016)
### Aliases: bCM

### ** Examples

### get allometry model for each species
CSP <- plyr::dlply(allometry, c("spp"), bCM)
CSP.coef <- plyr::ldply(CSP, stats::coef)
### add lambda value
CSP.coef$lam <- plyr::ddply(allometry, c("spp"), function(df)  
                bCM(df, lam.only = TRUE))[, "V1"]



