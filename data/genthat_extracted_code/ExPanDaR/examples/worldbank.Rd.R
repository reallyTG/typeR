library(ExPanDaR)


### Name: worldbank
### Title: A Snapshot of Macroeconomic Data as Provided by the World Bank
###   API (1960 - 2016)
### Aliases: worldbank
### Keywords: country data data, datasets, level macroeconomic

### ** Examples

data(worldbank)
prepare_missing_values_graph(worldbank, ts_id = "year")

data(worldbank_data_def)
data(worldbank_var_def)
data(ExPanD_config_worldbank)
## Not run: 
##D   ExPanD(worldbank, df_def = worldbank_data_def,
##D     var_def = worldbank_var_def, config_list = ExPanD_config_worldbank)
## End(Not run)




