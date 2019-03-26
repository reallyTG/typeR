library(latticeExtra)


### Name: EastAuClimate
### Title: Climate of the East Coast of Australia
### Aliases: EastAuClimate
### Keywords: datasets

### ** Examples

data(EastAuClimate)

## Compare the climates of state capital cities
EastAuClimate[c("Hobart", "Melbourne", "Sydney", "Brisbane"),]

## A function to plot maps (a Lattice version of maps::map)
lmap <-
   function(database = "world", regions = ".", exact = FALSE,
            boundary = TRUE, interior = TRUE, projection = "",
            parameters = NULL, orientation = NULL,
            aspect = "iso", type = "l",
            par.settings = list(axis.line = list(col = "transparent")),
            xlab = NULL, ylab = NULL, ...)
{
   theMap <- map(database, regions, exact = exact,
                 boundary = boundary, interior = interior,
                 projection = projection, parameters = parameters,
                 orientation = orientation, plot = FALSE)
   xyplot(y ~ x, theMap, type = type, aspect = aspect,
          par.settings = par.settings, xlab = xlab, ylab = ylab,
          default.scales = list(draw = FALSE), ...)
}

## Plot the sites on a map of Australia
if (require("maps")) {
  lmap(regions = c("Australia", "Australia:Tasmania"),
       exact = TRUE, projection = "rectangular",
       parameters = 150, xlim = c(130, 170),
       panel = function(...) {
          panel.xyplot(...)
          with(EastAuClimate, {
            panel.points(Longitude, Latitude, pch = 16)
            txt <- row.names(EastAuClimate)
            i <- c(3, 4)
            panel.text(Longitude[ i], Latitude[ i], txt[ i], pos = 2)
            panel.text(Longitude[-i], Latitude[-i], txt[-i], pos = 4)
          })
       })
}

## Average daily maximum temperature in July (Winter).
xyplot(WinterMaxTemp ~ Latitude, EastAuClimate, aspect = "xy",
       type = c("p", "a"), ylab = "Temperature (degrees C)")

## (Make a factor with levels in order - by coastal location)
siteNames <- factor(row.names(EastAuClimate),
           levels = row.names(EastAuClimate))
## Plot temperature ranges (as bars), color-coded by RainDays
segplot(siteNames ~ WinterMinTemp + SummerMaxTemp, EastAuClimate,
        level = RainDays, sub = "Color scale: number of rainy days per year",
        xlab = "Temperature (degrees C)",
        main = paste("Typical temperature range and wetness",
           "of coastal Australian cities", sep = "\n"))

## Show Winter and Summer temperature ranges separately
segplot(Latitude ~ WinterMinTemp + SummerMaxTemp, EastAuClimate,
   main = "Average daily temperature ranges \n of coastal Australian sites",
   ylab = "Latitude", xlab = "Temperature (degrees C)",
   par.settings = simpleTheme(lwd = 3, alpha = 0.5),
   key = list(text = list(c("July (Winter)", "February (Summer)")),
              lines = list(col = c("blue", "red"))),
   panel = function(x, y, z, ..., col) {
      with(EastAuClimate, {
         panel.segplot(WinterMinTemp, WinterMaxTemp, z, ..., col = "blue")
         panel.segplot(SummerMinTemp, SummerMaxTemp, z, ..., col = "red")
      })
   })

## Northern sites have Summer-dominated rainfall;
## Southern sites have Winter-dominated rainfall.
xyplot(SummerRain + WinterRain ~ Latitude, EastAuClimate,
       type = c("p", "a"), auto.key = list(lines = TRUE),
       ylab = "Rainfall (mm / month)")

## Clear days are most frequent in the mid latitudes.
xyplot(RainDays + CloudyDays + ClearDays ~ Latitude, EastAuClimate,
       type = c("p", "a"), auto.key = list(lines = TRUE),
       ylab = "Days per year")



