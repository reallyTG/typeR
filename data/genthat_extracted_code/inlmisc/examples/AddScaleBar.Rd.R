library(inlmisc)


### Name: AddScaleBar
### Title: Add Scale Bar to Plot
### Aliases: AddScaleBar
### Keywords: hplot

### ** Examples

plot(-100:100, -100:100, type = "n", xlab = "x in meters", ylab = "y in meters", asp = 2)
AddScaleBar()
AddScaleBar(loc = "center")
AddScaleBar(unit = "METERS", loc = "topleft", padin = 0.2)
AddScaleBar(unit = c("METERS", "FEET"), conv.fact = c(1, 3.28084),
            loc = "topright", padin = c(0.5, 0))
AddScaleBar(unit = c("METERS", "FEET"), conv.fact = c(1, 3.28084),
            vert.exag = TRUE, loc = "bottomright", inset = 0.1)

plot(c(-38.31, -35.5), c(40.96, 37.5), type = "n", xlab = "longitude", ylab = "latitude")
AddScaleBar(unit = "KILOMETERS", longlat = TRUE)
AddScaleBar(unit = "MILES", conv.fact = 0.621371, longlat = TRUE,
            loc = "topright", padin = c(0.4, 0))
AddScaleBar(unit = c("KILOMETERS", "MILES"), conv.fact = c(1, 0.621371),
            longlat = TRUE, loc = "topleft", inset = 0.05)




