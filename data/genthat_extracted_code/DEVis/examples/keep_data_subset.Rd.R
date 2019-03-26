library(DEVis)


### Name: keep_data_subset
### Title: Select a subset of count and target data based on metadata
###   annotation.
### Aliases: keep_data_subset
### Keywords: filter subset

### ** Examples

## Not run: 
##D 
##D myCounts <- prep_counts(count_input="master_count_data.txt", delim="t")
##D myTargets <- prep_targets(target_input="master_count_data.txt", delim="t")
##D 
##D #Get data for only "timepoint" at "day1".
##D data_subset <- keep_data_subset(counts=myCounts, targets=myTargets,
##D                                   target_count_id_map="sample_id",
##D                                   target_keep_col="timepoint",
##D                                   target_keep_val="day1")
##D 
##D #Count data is stored in the first index returned by the function.
##D subset_counts <- data_subset[[1]]
##D 
##D #Target data is stored in the second index returned by the function.
##D subset_targets <- data_subset[[2]]
##D 
##D 
##D #Get data for only "timepoint" at "day1" and "day2".
##D data_subset <- keep_data_subset(counts=myCounts, targets=myTargets,
##D                                   target_count_id_map="sample_id",
##D                                   target_keep_col="timepoint",
##D                                   target_keep_val=c("day1","day2"))
##D 
##D #Count data is stored in the first index returned by the function.
##D subset_counts <- data_subset[[1]]
##D 
##D #Target data is stored in the second index returned by the function.
##D subset_targets <- data_subset[[2]]
##D 
## End(Not run)



