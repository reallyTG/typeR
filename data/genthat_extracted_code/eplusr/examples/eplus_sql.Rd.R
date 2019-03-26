library(eplusr)


### Name: eplus_sql
### Title: Read an Energy SQLite Output File
### Aliases: eplus_sql

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
##D }
## End(Not run)



