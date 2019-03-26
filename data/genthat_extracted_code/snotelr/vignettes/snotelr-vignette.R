## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

# load the library
library(snotelr)

# check cran, same routine as skip_on_cran()
# but not dependent on testthat which might
# not be available on user systems (not required
# only suggested)
check_cran <- function() {
  if (identical(tolower(Sys.getenv("NOT_CRAN")), "true")) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# do cran check
cran <- check_cran()

# for local render set to true
# mainly important for rendering
# a website using pkgdown
#cran <- TRUE

## ----eval = cran---------------------------------------------------------
# download and list site information
site_meta_data <- snotel_info()
head(site_meta_data)

## ----eval = cran---------------------------------------------------------
# downloading data for a random site
snow_data <- snotel_download(site_id = 670, internal = TRUE)

# show the data
head(snow_data)

## ----fig.width = 7, fig.height=3, eval = cran----------------------------
# A plot of snow accummulation through the years
plot(as.Date(snow_data$date),
     snow_data$snow_water_equivalent,
     type = "l",
     xlab = "Date",
     ylab = "SWE (mm)")

## ----eval = cran---------------------------------------------------------
# calculate snow phenology
phenology <- snotel_phenology(snow_data)

## ----fig.width = 7, fig.height=3, eval = cran----------------------------
# subset data to the first decade of the century
snow_data_subset <- subset(snow_data, as.Date(date) > as.Date("2000-01-01") &
                             as.Date(date) < as.Date("2010-01-01"))

# plot the snow water equivalent time series
plot(as.Date(snow_data_subset$date),
     snow_data_subset$snow_water_equivalent,
     type = "l",
     xlab = "Date",
     ylab = "SWE (mm)")

# plot the dates of first snow accumulation as a red dot
points(as.Date(paste(phenology$year, phenology$first_snow_acc),"%Y %j"),
       rep(1,nrow(phenology)),
       col = "red",
       pch = 19,
       cex = 0.5)


