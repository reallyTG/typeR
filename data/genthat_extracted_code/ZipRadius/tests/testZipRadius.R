library(testthat)
library(geosphere)
library(magrittr)
library(dplyr)

zipList <- data.frame(zip="30316",
                      city="Atlanta",
                      state="GA",
                      latitude=as.numeric(33.72951),
                      longitude=as.numeric(-84.34087))

zipRadius <- function(zipcode, radius){
  # Get the lat/lon of the reference zip
  refPoint <- dplyr::filter(zipList, .data$zip == zipcode) %>%
    dplyr::select(.data$latitude, .data$longitude) %>%
    dplyr::rename(refLat = .data$latitude, refLon = .data$longitude)

  # Add the lat/lon of the ref zip to the zipList
  zipList <- cbind(zipList, refPoint)

  # Radius of Earth in miles to adjust for km
  r = 3959

  # Creating Table of the coordinates. Makes it easy to calc distance
  Points1 <- cbind(zipList$longitude,zipList$latitude)
  Points2 <- cbind(zipList$refLon,zipList$refLat)
  distance <- distHaversine(Points1,Points2,r)

  # Adding distance back on to the original zipList
  zipList$Distance <- round(distance, 2)

  # Remove reference lat/lon and filter down to below selected radius
  zipList <- dplyr::select(zipList, -.data$refLat, -.data$refLon) %>%
    dplyr::filter(.data$Distance < radius)

  return(zipList)
}

test <- zipRadius("30316", 10)
expect_that(test, is_a("data.frame"))

