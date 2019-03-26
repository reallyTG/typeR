library(Rcan)


### Name: csu_CI5X_data
### Title: Cancer in five continent volume X.
### Aliases: csu_CI5X_data
### Keywords: datasets

### ** Examples


data("csu_CI5X_data")

#get the registry code asssociate to registry_label
print(unique(csu_CI5X_data[,c("registry_label", "registry_code")]),nrows = 1000)

#get the cancer code asssociate to cancer_label
print(unique(csu_CI5X_data[,c("cancer_label", "cancer_code")]),nrows = 1000)

#remove all cancers:
df_data <- csu_CI5X_data[csu_CI5X_data$cancer_code < 62,]


#select Thailand changmai
df_data_1 <- df_data[df_data$registry_code==76401,]






dt_result_1 <- csu_ageSpecific_top(df_data_1,
                    var_age="age", 
                    var_cases="cases", 
                    var_py="py",
                    var_top="cancer_label", 
                    group_by="sex", 
                    plot_title= "Thailand, Chiangmai",
                    plot_subtitle = "Top 5 cancer",
                    missing_age = 19)



## No test: 
					
#select USAm NPCR
df_data_2 <- df_data[df_data$registry_code== 84080,]

dt_result_2 <- csu_ageSpecific_top(df_data_2,
                                   var_age="age", 
                                   var_cases="cases", 
                                   var_py="py",
                                   var_top="cancer_label", 
                                   group_by="sex", 
                                   plot_title= "USA, NPCR",
                                   plot_subtitle = "Top 5 cancer",
                                   missing_age = 19)


				  
## End(No test)			  



