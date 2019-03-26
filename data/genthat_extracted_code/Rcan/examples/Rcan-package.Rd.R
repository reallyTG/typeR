library(Rcan)


### Name: Rcan-package
### Title: Cancer Registry Data Analysis and Visualisation
### Aliases: Rcan-package Rcan
### Keywords: package

### ** Examples

data(csu_registry_data_2)
				  
# ASR with standard error with missing age.
df_asr <- csu_asr(csu_registry_data_2, 
                  "age", "cases", "py",
                  group_by = c("registry", "registry_label", "sex", "year", "ethnic" ),
                  var_age_group = c("registry_label"), 
                  var_st_err = "st_err")

df_asr[1:4,]	


## No test: 
# ASR with standard error with missing age.		  
readline(prompt="Press [enter] to continue to EAPC")


# EAPC with standard error		
	  
df_eapc <- csu_eapc(df_asr,
					"asr", "year",
					group_by=c("registry", "registry_label", "sex", "ethnic" ))
					
df_eapc[1:4,]	

# EAPC with standard error				  
readline(prompt="Press [enter] to continue to age specific graph")

data(csu_registry_data_1)

# plot age specific rate for 1 population.
df_colombia <- csu_registry_data_1[csu_registry_data_1$registry_label=="Colombia, Cali",]

csu_ageSpecific(df_colombia,
			plot_title = "Colombia, Liver, male")
				
# plot age specific rate for 1 population, and comparison with CI5X data.
csu_ageSpecific(df_colombia,
				plot_title = "Colombia, Liver, male",
				CI5_comparison = "Liver")
			
# plot age specific rate for 4 population, legend at the bottom and comparison with CI5X data.
csu_ageSpecific(csu_registry_data_1,
				group_by="registry_label",
				legend=csu_trend_legend(position="bottom", nrow = 2),
				plot_title = "Liver, male",
				CI5_comparison = 7)
	
## End(No test)	



