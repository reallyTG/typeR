library(Rcan)


### Name: csu_eapc
### Title: csu_eapc
### Aliases: csu_eapc

### ** Examples


data(csu_registry_data_2)

# you import your data from csv file using read.csv:
# mydata <-  read.csv("mydata.csv", sep=",")

# Estimated Annual Percentage Change (EAPC) base on ASR.

## No test: 
df_asr <- 
	csu_asr(csu_registry_data_2, 
	  "age", "cases", "py",
	  group_by = c("registry", "registry_label", "sex", "year", "ethnic" ),
	  var_age_group = c("registry_label"), 
	  missing_age = 99
	  )
				  
result <- 
	csu_eapc(df_asr,
		"asr", "year",
		group_by=c("registry", "registry_label", "sex", "ethnic" )
		)

## End(No test)					
# you can export your result as csv file using write.csv:
# write.csv(result, file="result.csv")
				  		  



