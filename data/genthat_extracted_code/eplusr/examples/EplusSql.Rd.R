library(eplusr)


### Name: EplusSql
### Title: Retrieve Simulation Outputs Using EnergyPlus SQLite Output File
### Aliases: EplusSql

### ** Examples

## Not run: 
##D if (is_avail_eplus(8.8)) {
##D     idf_name <- "1ZoneUncontrolled.idf"
##D     epw_name <-  "USA_CA_San.Francisco.Intl.AP.724940_TMY3.epw"
##D 
##D     idf_path <- file.path(eplus_config(8.8)$dir, "ExampleFiles", idf_name)
##D     epw_path <- file.path(eplus_config(8.8)$dir, "WeatherData", epw_name)
##D 
##D     # copy to tempdir and run the model
##D     idf <- read_idf(idf_path)
##D     idf$run(epw_path, tempdir())
##D 
##D     # create from local file
##D     sql <- eplus_sql(file.path(tempdir(), "1ZoneUncontrolled.sql"))
##D 
##D     # get sql file path
##D     sql$path()
##D 
##D     # list all tables in the sql file
##D     sql$list_table()
##D 
##D     # read a specific table
##D     sql$read_table("Zones")
##D 
##D     # read report data dictionary
##D     sql$report_data_dict()
##D 
##D     # read report data
##D     sql$report_data(name = "EnergyTransfer:Building")
##D 
##D     # read tabular data
##D     sql$tabular_data()
##D }
## End(Not run)




