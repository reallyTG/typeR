library(polymapR)


### Name: assign_linkage_group
### Title: Assign non-SN markers to a linkage group and homologue(s).
### Aliases: assign_linkage_group

### ** Examples

data("SN_DN_P1", "LGHomDf_P1_1")
assigned_df<-assign_linkage_group(linkage_df = SN_DN_P1,
                     LG_hom_stack = LGHomDf_P1_1,
                     LG_number = 5)



