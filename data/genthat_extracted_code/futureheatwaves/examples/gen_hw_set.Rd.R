library(futureheatwaves)


### Name: gen_hw_set
### Title: Create and write extreme event projections
### Aliases: gen_hw_set

### ** Examples

## Not run: 
##D projection_dir_location <- system.file("extdata/cmip5",
##D                                       package = "futureheatwaves")
##D city_file_location <- system.file("extdata/cities.csv",
##D                                  package = "futureheatwaves")
##D gen_hw_set(out = "example_results",
##D            dataFolder = projection_dir_location ,
##D            dataDirectories = list("historical" = c(1990, 1999),
##D                                   "rcp85" = c(2060, 2079)),
##D            citycsv = city_file_location,
##D            coordinateFilenames = "latitude_longitude_NorthAmerica_12mo.csv",
##D            tasFilenames = "tas_NorthAmerica_12mo.csv",
##D            timeFilenames = "time_NorthAmerica_12mo.csv")
## End(Not run)




