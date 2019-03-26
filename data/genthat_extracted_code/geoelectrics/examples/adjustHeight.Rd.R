library(geoelectrics)


### Name: adjustHeight
### Title: Adjust Profile Height
### Aliases: adjustHeight adjustHeight,Profile-method

### ** Examples

p3 <- new(
  "Profile",
  title = "Profile 3",
  processedData =
    new("ProcessedData",
        address = system.file("extdata/processed/p3_DipolDipol_S-N.xyz",
                  package='geoelectrics')),
  rawData =
    new("RawData",
        address = system.file("extdata/raw/p3_DipolDipol_S-N.dat",
                  package='geoelectrics')),
  measurementType = "DipolDipol",
  gpsCoordinates =
    new("GpsCoordinates",
        address = system.file("extdata/gps/p3.txt",
                  package='geoelectrics'))
)

p3 <- adjustHeight(p3, -10)



