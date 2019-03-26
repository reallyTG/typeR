library(ExPanDaR)


### Name: ExPanD
### Title: Explore Panel Data (ExPanD)
### Aliases: ExPanD

### ** Examples

## Not run: 
##D   ExPanD()
##D   # Use this if you want to read very large files via the file dialog
##D   options(shiny.maxRequestSize = 1024^3)
##D   ExPanD()
##D 
##D   data(russell_3000)
##D   ExPanD(russell_3000, c("coid", "coname"), "period")
##D   ExPanD(russell_3000, df_def = russell_3000_data_def)
##D   ExPanD(russell_3000, df_def = russell_3000_data_def,
##D     components = c(ext_obs = T, descriptive_table = T, regression = T))
##D   ExPanD(russell_3000, df_def = russell_3000_data_def,
##D     components = c(missing_values = F, by_group_violin_graph = F))
##D   data(ExPanD_config_russell_3000)
##D   ExPanD(df = russell_3000, df_def = russell_3000_data_def,
##D     config_list = ExPanD_config_russell_3000)
##D   exploratory_sample <- sample(nrow(russell_3000), round(0.5*nrow(russell_3000)))
##D   test_sample <- setdiff(1:nrow(russell_3000), exploratory_sample)
##D   ExPanD(df = list(russell_3000[exploratory_sample, ], russell_3000[test_sample, ]),
##D     df_def = russell_3000_data_def,
##D     df_name = c("Exploratory sample", "Test sample"))
##D   ExPanD(worldbank, df_def = worldbank_data_def, var_def = worldbank_var_def,
##D     config_list = ExPanD_config_worldbank)
## End(Not run)



