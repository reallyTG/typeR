library(polymapR)


### Name: homologue_lg_assignment
### Title: Assign markers to linkage groups and homologues.
### Aliases: homologue_lg_assignment

### ** Examples

## Not run: 
##D data("screened_data3", "P1_SxS_Assigned", "P1_DxN_Assigned", "LGHomDf_P1_1")
##D Assigned_markers<-homologue_lg_assignment(screened_data3,
##D                          assigned_list = list(P1_SxS_Assigned, P1_DxN_Assigned),
##D                          assigned_markertypes = list(c(1,1), c(2,0)),
##D                          LG_hom_stack = LGHomDf_P1_1,ploidy=4,
##D                          write_intermediate_files=FALSE)
##D                          
## End(Not run)



