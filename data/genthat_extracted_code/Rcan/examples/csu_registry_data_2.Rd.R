library(Rcan)


### Name: csu_registry_data_2
### Title: cancer registry data
### Aliases: csu_registry_data_2
### Keywords: datasets

### ** Examples


data(csu_registry_data_2)
				  
# ASR and standard error with missing age.
result <- csu_asr(csu_registry_data_2, 
                  "age", "cases", "py",
                  group_by = c("registry", "registry_label", "sex", "year", "ethnic" ),
                  var_age_group = c("registry_label"), 
				  missing_age = 99,
                  var_st_err = "st_err")
				  
#See more examples here:
help(csu_asr)	
				  



