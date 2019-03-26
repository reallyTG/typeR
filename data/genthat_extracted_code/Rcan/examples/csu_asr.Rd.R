library(Rcan)


### Name: csu_asr
### Title: csu_asr
### Aliases: csu_asr

### ** Examples

data(csu_registry_data_1)
data(csu_registry_data_2)

# you can import your data from csv file using read.csv:
# mydata <-  read.csv("mydata.csv", sep=",")

# Age standardized rate (ASR) with no missing age cases.
result <- csu_asr(csu_registry_data_1, 
                  "age", "cases", "py",
                  group_by = c("registry", "registry_label" ),
                  var_age_group = c("registry_label"))
				  
# you can export your result as csv file using write.csv:
# write.csv(result, file="result.csv")
				  
# ASR,  with the percentage of correction due to missing age cases. 
result <- csu_asr(csu_registry_data_1, 
                  "age", "cases", "py",
                  group_by = c("registry", "registry_label" ),
                  var_age_group = c("registry_label"),
				  missing_age = 19,				  
				  correction_info = TRUE)	
				  
# ASR and standard error with missing age.
result <- csu_asr(csu_registry_data_2, 
                  "age", "cases", "py",
                  group_by = c("registry", "registry_label", "sex", "year", "ethnic" ),
                  var_age_group = c("registry_label"), 
                  var_st_err = "st_err",
				  missing_age = 99)
				  
# Truncated ASR, 25-69 years.
result <- csu_asr(csu_registry_data_2, 
                  "age", "cases", "py",
                  group_by = c("registry", "registry_label", "sex", "year", "ethnic" ),
                  var_age_group = c("registry_label"), 
                  var_st_err = "st_err",
				  first_age = 6, 
				  last_age = 14,
				  missing_age = 99)	

# Truncated ASR, 0-15 with denominator population = 1000000. 
result <- csu_asr(csu_registry_data_2, 
                  "age", "cases", "py",
                  group_by = c("registry", "registry_label", "sex", "year", "ethnic" ),
                  var_age_group = c("registry_label"), 
                  var_st_err = "st_err",
				  first_age = 1, 
				  last_age = 3, 
				  missing_age = 99,	
				  db_rate = 1000000)		
				  
# ASR with EURO population as reference (instead of SEGI)
result <- csu_asr(csu_registry_data_1, 
                  "age", "cases", "py",
                  group_by = c("registry", "registry_label" ),
                  var_age_group = c("registry_label"),
				  missing_age = 19,
                  pop_base = "EURO")
				    		  



