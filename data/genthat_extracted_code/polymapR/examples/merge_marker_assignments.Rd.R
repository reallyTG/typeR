library(polymapR)


### Name: merge_marker_assignments
### Title: Merge marker assignments
### Aliases: merge_marker_assignments

### ** Examples

data("screened_data3", "LGHomDf_P1_1", "P1_SxS_Assigned", "P1_DxN_Assigned")
merged_assignment<-merge_marker_assignments(screened_data3, target_parent="P1",
                         other_parent="P2",
                         LG_hom_stack=LGHomDf_P1_1,
                         SN_linked_markers=list(P1_SxS_Assigned, P1_DxN_Assigned),
                         ploidy=4,
                         LG_number=5)



