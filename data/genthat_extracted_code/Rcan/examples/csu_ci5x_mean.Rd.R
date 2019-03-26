library(Rcan)


### Name: csu_ci5x_mean
### Title: cancer registry data
### Aliases: csu_ci5x_mean
### Keywords: datasets

### ** Examples


data(csu_registry_data_1)
test <- csu_registry_data_1[csu_registry_data_1$registry_label=="Colombia, Cali",]
csu_ageSpecific(test,
                plot_title = "Colombia, Liver, male",
                CI5_comparison = "Liver")
 
#See more examples here:
help(csu_ageSpecific)




