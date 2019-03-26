library(DEVis)


### Name: prep_dds_from_data
### Title: Prepare a DESeq2 object based on count and target data.
### Aliases: prep_dds_from_data
### Keywords: dds design normalization replicates

### ** Examples

## Not run: 
##D 
##D /*
##D  * Create a DESeq2 data object using previously read count and target data.
##D  * Differential expression groups indicated by "Infection" column of target data.
##D  * Apply a rlog transformation to the data. TMM normalization applied.
##D  */
##D dds <- prep_dds_from_data(count_input=myCounts, target_input=myTargets,
##D                            experiment_design= ~ Infection, stabilization="rld")
##D 
##D 
##D /*
##D  * Create a DESeq2 data object using previously read count and target data.
##D  * Differential expression groups indicated by "Infection" column of target data.
##D  * Takes into account a batch effect column of target data.
##D  * Apply a variance stabilizing transformation to the data. TMM normalization applied.
##D  */
##D dds <- prep_dds_from_data(count_input=myCounts, target_input=myTargets,
##D                            experiment_design= ~ batch + Infection, stabilization="vst")
##D 
##D 
##D /*
##D  * Create a DESeq2 data object using previously read count and target data.
##D  * Differential expression groups indicated by "Time" and "Infection" columns of target data.
##D  * Takes into account a batch effect column of target data.
##D  * Apply a variance stabilizing transformation to the data. TMM normalization applied.
##D  * Collapse technical replicates based on the "replicate" column of target data.
##D  */
##D dds <- prep_dds_from_data(count_input=myCounts, target_input=myTargets,
##D                            experiment_design= ~ batch + Time + Infection,
##D                            collapseReps=TRUE,
##D                            rep_field_vector="replicate",
##D                            stabilization="vst")
##D 
##D  
## End(Not run)



