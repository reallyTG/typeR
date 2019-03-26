library(Rcan)


### Name: csu_registry_data_1
### Title: cancer registry data
### Aliases: csu_registry_data_1
### Keywords: datasets

### ** Examples


data(csu_registry_data_1)

# Age standardized rate (ASR) with no missing age cases.
result <- csu_asr(csu_registry_data_1, 
                  "age", "cases", "py",
                  group_by = c("registry", "registry_label" ),
                  var_age_group = c("registry_label"))
				  
#See more examples here:
help(csu_asr)

				  
				  



