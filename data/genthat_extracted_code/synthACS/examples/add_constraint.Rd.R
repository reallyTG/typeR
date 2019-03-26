library(synthACS)


### Name: add_constraint
### Title: Add new constraint to constraint table
### Aliases: add_constraint

### ** Examples

## Not run: 
##D ## assumes that you have a micro_synthetic dataset named test_micro and attribute counts
##D ## named a,e,g respectively 
##D c_list <- add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)
##D c_list <- add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
##D                         constraint_list= c_list)
##D c_list <- add_constraint(attr_name= "gender", attr_totals= g, micro_data= test_micro,
##D                          constraint_list= c_list)
## End(Not run)



