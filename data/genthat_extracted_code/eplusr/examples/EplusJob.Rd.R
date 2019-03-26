library(eplusr)


### Name: EplusJob
### Title: Run EnergyPlus Simulation and Collect Outputs
### Aliases: EplusJob

### ** Examples

## Not run: 
##D if (is_avail_eplus(8.8)) {
##D     idf_name <- "1ZoneUncontrolled.idf"
##D     epw_name <-  "USA_CA_San.Francisco.Intl.AP.724940_TMY3.epw"
##D 
##D     idf_path <- file.path(eplus_config(8.8)$dir, "ExampleFiles", idf_name)
##D     epw_path <- file.path(eplus_config(8.8)$dir, "WeatherData", epw_name)
##D 
##D     # copy to tempdir
##D     file.copy(c(idf_path, epw_path), tempdir())
##D 
##D     # create an EplusJob from local an IDF and an EPW file
##D     job <- eplus_job(file.path(tempdir(), idf_name), file.path(tempdir(), epw_name))
##D 
##D     # get paths of idf and epw
##D     job$path("all")
##D     job$path("idf")
##D     job$path("epw")
##D 
##D     # get current job status
##D     job$status()
##D 
##D     # check if the job has been run before
##D     job$status()$run_before
##D 
##D     # run the job in waiting mode
##D     job$run(wait = TRUE)
##D 
##D     # check the job status again
##D     job$status()$run_before
##D     job$status()$successful
##D 
##D     # get output directory
##D     job$output_dir()
##D 
##D     # open the output directory
##D     job$output_dir(open = TRUE)
##D 
##D     # check simulation errors
##D     job$errors()
##D 
##D     # check simulation errors, only including warnings and errors
##D     job$errors(info = FALSE)
##D 
##D     # get the file path of an output with a given suffix
##D     job$locate_output(".err")
##D 
##D     # give an error when simulation did not complete successfully or that file
##D     # does not exist
##D     job$locate_output(".exe", strict = TRUE)
##D 
##D     # retrieve simulation results will fail if there is no EnergyPlus SQL output.
##D     job$report_data_dict()
##D 
##D     # instead, using `$run()` method in Idf class, which will add an
##D     # `Output:SQLite` object automatically
##D     idf <- read_idf(file.path(tempdir(), idf_name))
##D     job <- idf$run(file.path(tempdir(), epw_name), dir = NULL)
##D 
##D     # get report data dictionary
##D     str(job$report_data_dict())
##D 
##D     # extract all report data
##D     str(job$report_data())
##D 
##D     # extract some report variable
##D     str(job$report_data(name = "EnergyTransfer:Building", case = NULL))
##D 
##D     # add a "Case" column in the returned data.table
##D     str(job$report_data(name = "EnergyTransfer:Building", case = "Test"))
##D 
##D     # change the format of datetime column in the returned data.table
##D     str(job$report_data(name = "EnergyTransfer:Building", year = 2016L, tz = Sys.timezone()))
##D 
##D     # get all tabular data
##D     str(job$tabular_data())
##D }
## End(Not run)



