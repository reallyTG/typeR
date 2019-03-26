library(DEVis)


### Name: make_composite_field
### Title: Create a composite metadata field by merging existing data.
### Aliases: make_composite_field
### Keywords: aggregate metadata

### ** Examples

## Not run: 
##D 
##D myCounts <- prep_counts(count_input="master_count_data.txt", delim="t")
##D myTargets <- prep_targets(target_input="master_count_data.txt", delim="t")
##D 
##D #Create a composite field based on "treatment" and "time" fields.
##D myTargets <- make_composite_field(targets=myTargets,
##D                                   merge_fields=c("treatment","time"))
##D 
##D 
##D #Create a composite field based on "treatment", "time", and "patientID" fields.
##D myTargets <- make_composite_field(targets=myTargets,
##D                                   merge_fields=c("treatment","time","patientID"))
##D 
##D 
## End(Not run)



