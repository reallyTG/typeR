library(polymapR)


### Name: assign_SN_SN
### Title: Assign (leftover) 1.0 markers
### Aliases: assign_SN_SN

### ** Examples

data("SN_SN_P1", "LGHomDf_P1_1")
SN_assigned<-assign_SN_SN(linkage_df = SN_SN_P1,
             LG_hom_stack = LGHomDf_P1_1,
             LOD_threshold= 4,
             ploidy=4,
             LG_number=5)



