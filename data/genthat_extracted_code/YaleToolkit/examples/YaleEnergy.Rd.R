library(YaleToolkit)


### Name: YaleEnergy
### Title: Monthly energy consumption of Yale residential colleges.
### Aliases: YaleEnergy
### Keywords: datasets

### ** Examples

data(YaleEnergy)
whatis(YaleEnergy)

y <- YaleEnergy             # This is just for convenience.
esqft <- list(data.frame(y[y$name==y$name[1],"ELSQFT"]),
              data.frame(y[y$name==y$name[2],"ELSQFT"]),
              data.frame(y[y$name==y$name[3],"ELSQFT"]),
              data.frame(y[y$name==y$name[4],"ELSQFT"]),
              data.frame(y[y$name==y$name[5],"ELSQFT"]),
              data.frame(y[y$name==y$name[6],"ELSQFT"]),
              data.frame(y[y$name==y$name[7],"ELSQFT"]),
              data.frame(y[y$name==y$name[8],"ELSQFT"]),
              data.frame(y[y$name==y$name[9],"ELSQFT"]),
              data.frame(y[y$name==y$name[10],"ELSQFT"]),
              data.frame(y[y$name==y$name[11],"ELSQFT"]),
              data.frame(y[y$name==y$name[12],"ELSQFT"]))

# The sparkmat() command does most of the work:
sparkmat(esqft, locs=data.frame(y$lon, y$lat), new=TRUE,
         w=0.002, h=0.0002, just=c("left", "top"))

# We'll add some text for a nice finished product:
grid.text(y[1:12,1], unit(y$lon[1:12]+0.001, "native"),
          unit(y$lat[1:12]+0.00003, "native"),
          just=c("center", "bottom"), gp=gpar(cex=0.7))
grid.text("Degrees Longitude", 0.5, unit(-2.5, "lines"))
grid.text("Degrees Latitude", unit(-4.5, "lines"), 0.5, rot=90)
grid.text("Monthly Electrical Consumption (KwH/SqFt) of Yale Colleges",
          0.5, 0.8, gp=gpar(cex=1, font=2))
grid.text("July 1999 - July 2006",
          0.5, 0.74, gp=gpar(cex=1, font=2))



