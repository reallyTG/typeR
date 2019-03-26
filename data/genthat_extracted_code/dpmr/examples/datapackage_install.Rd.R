library(dpmr)


### Name: datapackage_install
### Title: Install a data package
### Aliases: datapackage_install

### ** Examples

## Not run: 
##D # Load a data package called gdp stored in the current working directory:
##D gdp_data = datapackage_install(path = 'gdp')
##D 
##D # Install the gdp data package from GitHub using its .zip URL
##D URL <- 'https://github.com/datasets/gdp/archive/master.zip'
##D gdp_data <- datapackage_install(path = URL)
##D 
##D # Install co2 data
##D library(dplyr)
##D co2_data <- "https://github.com/datasets/co2-ppm/archive/master.zip" %>%
##D          datapackage_install()
## End(Not run)



