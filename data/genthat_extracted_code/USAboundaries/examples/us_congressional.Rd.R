library(USAboundaries)


### Name: us_congressional
### Title: Congressional district boundaries (contemporary)
### Aliases: us_congressional

### ** Examples

if (require(USAboundariesData) && require(sf)) {
  us_congressional <- us_congressional()
  va_congressional <- us_congressional(states = "Virginia", resolution = "high")
  plot(st_geometry(us_congressional))
  plot(st_geometry(va_congressional))
}




