library(eplusr)


### Name: ParametricJob
### Title: Create and Run Parametric Analysis, and Collect Results
### Aliases: ParametricJob

### ** Examples

if (is_avail_eplus(8.8)) {
    idf_name <- "1ZoneUncontrolled.idf"
    epw_name <-  "USA_CA_San.Francisco.Intl.AP.724940_TMY3.epw"

    idf_path <- file.path(eplus_config(8.8)$dir, "ExampleFiles", idf_name)
    epw_path <- file.path(eplus_config(8.8)$dir, "WeatherData", epw_name)

    # create from local files
    param_job(idf_path, epw_path)

    # create from an Idf and an Epw object
    param_job(read_idf(idf_path), read_epw(epw_path))
}



