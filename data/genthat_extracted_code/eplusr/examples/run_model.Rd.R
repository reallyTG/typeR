library(eplusr)


### Name: run_idf
### Title: Run simulations of EnergyPlus models.
### Aliases: run_idf run_multi

### ** Examples

## Not run: 
##D idf_path <- system.file("extdata/1ZoneUncontrolled.idf", package = "eplusr")
##D 
##D if (is_avail_eplus(8.8)) {
##D     # run a single model
##D     epw_path <- file.path(
##D         eplus_config(8.8)$dir,
##D         "WeatherData",
##D         "USA_CA_San.Francisco.Intl.AP.724940_TMY3.epw"
##D     )
##D 
##D     run_idf(idf_path, epw_path, output_dir = tempdir())
##D 
##D     # run multiple model in parallel
##D     idf_paths <- file.path(eplus_config(8.8)$dir, "ExampleFiles",
##D         c("1ZoneUncontrolled.idf", "1ZoneUncontrolledFourAlgorithms.idf")
##D     )
##D     epw_paths <- rep(epw_path, times = 2L)
##D     output_dirs <- file.path(tempdir(), tools::file_path_sans_ext(basename(idf_paths)))
##D     run_multi(idf_paths, epw_paths, output_dir = output_dirs)
##D }
## End(Not run)



