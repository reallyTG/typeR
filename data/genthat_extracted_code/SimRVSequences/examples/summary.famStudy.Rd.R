library(SimRVSequences)


### Name: summary.famStudy
### Title: Summary function for objects of class famStudy
### Aliases: summary.famStudy

### ** Examples

library(SimRVSequences)

#load pedigree, haplotype, and mutation data
data(study_peds)
data(EXmuts)
data(EXhaps)

#create variable is_CRV in EXmuts to identify the causal
#rare variants from which to sample familial cRVs.
EXmuts$is_CRV = FALSE
EXmuts$is_CRV[c(26, 139, 223, 228, 472)] = TRUE

#supply required inputs to the sim_RVstudy function
seqDat = sim_RVstudy(ped_files = study_peds,
                     SNV_map = EXmuts,
                     haplos = EXhaps)

#to count the number of SNVs shared by the disease-affected
#relatives in each pedigree, supply the output returned by
#sim_RVstudy to the summary function
summary(seqDat)





