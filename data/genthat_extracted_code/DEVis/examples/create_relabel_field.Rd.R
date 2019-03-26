library(DEVis)


### Name: create_relabel_field
### Title: Create a new metadata field by renaming existing levels of an
###   existing field.
### Aliases: create_relabel_field
### Keywords: aggregate metadata

### ** Examples

## Not run: 
##D 
##D myCounts <- prep_counts(count_input="master_count_data.txt", delim="t")
##D myTargets <- prep_targets(target_input="master_count_data.txt", delim="t")
##D 
##D #Create a  field based on the "treatment_time" fields with new labels.
##D myTargets <- create_relabel_field(target_column="treatment_time",
##D                                  new_column_name="treatment_time_relabel")
##D 
## End(Not run)



