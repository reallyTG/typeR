library(synthACS)


### Name: all_geogs_add_constraint
### Title: Add new constraint to a set of geographies
### Aliases: all_geogs_add_constraint

### ** Examples

## Not run: 
##D # assumes that micro_synthetic already exists in your environment
##D 
##D # 1. build constraints for gender and age
##D g <- all_geog_constraint_gender(micro_synthetic, method= "macro.table")
##D 
##D a <- all_geog_constraint_age(micro_synthetic, method= "macro.table")
##D 
##D # 2. bind constraints to geographies and macro-data
##D cll <- all_geogs_add_constraint(attr_name= "age", attr_total_list= a, 
##D           macro_micro= micro_synthetic)
##D cll <- all_geogs_add_constraint(attr_name= "gender", attr_total_list= g, 
##D           macro_micro= micro_synthetic, constraint_list_list= cll)
##D 
## End(Not run)



