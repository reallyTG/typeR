library(SimRVSequences)


### Name: sim_RVstudy
### Title: Simulate sequence data for a sample of pedigrees
### Aliases: sim_RVstudy

### ** Examples

library(SimRVSequences)

#load pedigree, haplotype, and mutation data
data(study_peds)
data(EXmuts)
data(EXhaps)

# create variable 'is_CRV' in EXmuts.  This variable identifies the pool of
# causal rare variants  from which to sample familial cRVs.
EXmuts$is_CRV = FALSE
EXmuts$is_CRV[c(26, 139, 223, 228, 472)] = TRUE

#supply required inputs to the sim_RVstudy function
seqDat = sim_RVstudy(ped_files = study_peds,
                     SNV_map = EXmuts,
                     haplos = EXhaps)


# Inbreeding examples
# Due to the forward-in-time model used by sim_RVstudy certain types of
# inbreeding and/or loops *may* cause fatal errors when using sim_RVstudy.
# The following examples demonstrate: (1) imbreeding that can be accommodated
# under this model, and (2) when this limitation is problematic.

# Create inbreeding in family 1 of study_peds
imb_ped1 <- study_peds[study_peds$FamID == 3, ]
imb_ped1[imb_ped1$ID == 18, c("momID")] = 7
plot(imb_ped1)

# Notice that this instance of inbreeding can be accommodated by our model.
seqDat = sim_RVstudy(ped_files = imb_ped1,
                     SNV_map = EXmuts,
                     haplos = EXhaps)

# Create different type of inbreeding in family 1 of study_peds
imb_ped2 <- study_peds[study_peds$FamID == 3, ]
imb_ped2[imb_ped1$ID == 8, c("momID")] = 18
plot(imb_ped2)

# Notice that inbreeding in imb_ped2 will cause a fatal
# error when the sim_RVstudy function is executed
## Not run: 
##D seqDat = sim_RVstudy(ped_files = imb_ped2,
##D                      SNV_map = EXmuts,
##D                      haplos = EXhaps)
## End(Not run)




