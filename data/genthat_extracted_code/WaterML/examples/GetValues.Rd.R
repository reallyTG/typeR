library(WaterML)


### Name: GetValues
### Title: GetValues
### Aliases: GetValues
### Keywords: waterml

### ** Examples

#example 1: Get Values from a known site and variable from RushValley server
v1 <- GetValues("http://worldwater.byu.edu/app/index.php/rushvalley/services/cuahsi_1_1.asmx?WSDL",
           site="Ru5BMMA", variable="SRS_Nr_NDVI", startDate="2014-11-01", endDate="2014-11-02",
           daily="max")
#example 2: Get values from an external REST URL (in this case the Provo USGS NWIS site id 10163000)
url <- "http://waterservices.usgs.gov/nwis/dv/?format=waterml,1.1&sites=10163000&parameterCd=00060"
v2 <- GetValues(url)
#example 3: Get values from WaterML 2.0 file and show year, month, day
url2 <- "http://www.waterml2.org/KiWIS-WML2-Example.wml"
waterml2_data <- GetValues(url2)
waterml2_data$year <- strftime(waterml2_data$time, "%Y")
waterml2_data$month <- strftime(waterml2_data$time, "%M")
waterml2_data$day <- strftime(waterml2_data$time, "%d")



