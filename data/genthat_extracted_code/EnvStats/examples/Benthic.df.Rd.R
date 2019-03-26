library(EnvStats)


### Name: Benthic.df
### Title: Benthic Data from Monitoring Program in Chesapeake Bay
### Aliases: Benthic.df
### Keywords: datasets

### ** Examples

  attach(Benthic.df)

  # Show station locations
  #-----------------------
  dev.new()
  plot(Longitude, Latitude, 
      xlab = "-Longitude (Degrees West)",
      ylab = "Latitude",
      main = "Sampling Station Locations")


  # Scatterplot matrix of benthic index, salinity, and silt
  #--------------------------------------------------------
  dev.new()
  pairs(~ Index + Salinity + Silt, data = Benthic.df)


  # Contour and perspective plots based on loess fit
  # showing only predicted values within the convex hull
  # of station locations
  #-----------------------------------------------------
  library(sp)

  loess.fit <- loess(Index ~ Longitude * Latitude,
      data=Benthic.df, normalize=FALSE, span=0.25)
  lat <- Benthic.df$Latitude
  lon <- Benthic.df$Longitude
  Latitude <- seq(min(lat), max(lat), length=50)
  Longitude <- seq(min(lon), max(lon), length=50)
  predict.list <- list(Longitude=Longitude,
      Latitude=Latitude)
  predict.grid <- expand.grid(predict.list)
  predict.fit <- predict(loess.fit, predict.grid)
  index.chull <- chull(lon, lat)
  inside <- point.in.polygon(point.x = predict.grid$Longitude, 
      point.y = predict.grid$Latitude, 
      pol.x = lon[index.chull], 
      pol.y = lat[index.chull])
  predict.fit[inside == 0] <- NA

  dev.new()
  contour(Longitude, Latitude, predict.fit,
      levels=seq(1, 5, by=0.5), labcex=0.75,
      xlab="-Longitude (degrees West)",
      ylab="Latitude (degrees North)")
  title(main=paste("Contour Plot of Benthic Index",
      "Based on Loess Smooth", sep="\n"))

  dev.new()
  persp(Longitude, Latitude, predict.fit,
      xlim = c(-77.3, -75.9), ylim = c(38.1, 39.5), zlim = c(0, 6), 
      theta = -45, phi = 30, d = 0.5,
      xlab="-Longitude (degrees West)",
      ylab="Latitude (degrees North)",
      zlab="Benthic Index", ticktype = "detailed")
  title(main=paste("Surface Plot of Benthic Index",
      "Based on Loess Smooth", sep="\n"))

  detach("Benthic.df")

  rm(loess.fit, lat, lon, Latitude, Longitude, predict.list,
      predict.grid, predict.fit, index.chull, inside)



