library(agridat)


### Name: nebraska.farmincome
### Title: Nebraska farm income in 2007 by county
### Aliases: nebraska.farmincome
### Keywords: datasets

### ** Examples


data(nebraska.farmincome)
dat <- nebraska.farmincome

if(require("maps") & require("mapproj") & require("latticeExtra")) {
  # latticeExtra for mapplot

  dat$stco <- paste0('nebraska,', dat$county)
  # Scale to million dollars per county
  dat <- transform(dat, crop=crop/1000, animal=animal/1000)
  
  # Raw, county-wide incomes.  Note the outlier Cuming county
  redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
  mapplot(stco ~ crop + animal, data = dat, colramp=redblue,
          main="nebraska.farmincome",
          xlab="Farm income from animals and crops (million $ per county)",
          scales = list(draw = FALSE), 
          map = map('county', 'nebraska', plot = FALSE, fill = TRUE,
            projection = "mercator") )

  # Now scale to income/mile^2
  dat <- within(dat, {
    crop.rate <- crop/area
    animal.rate <- animal/area
  })
  # And use manual breakpoints.
  mapplot(stco ~ crop.rate + animal.rate, data = dat, colramp=redblue,
          main="nebraska.farmincome: income per square mile (percentile breaks)",
          xlab="Farm income (million $ / mi^2) from animals and crops",
          scales = list(draw = FALSE), 
          map = map('county', 'nebraska', plot = FALSE, fill = TRUE,
            projection = "mercator"),
          # Percentile break points
          # breaks=quantile(c(dat$crop.rate, dat$animal.rate),
          #                 c(0,.1,.2,.4,.6,.8,.9,1), na.rm=TRUE)
          # Fisher-Jenks breakpoints via classInt package
          # breaks=classIntervals(na.omit(c(dat$crop.rate, dat$animal.rate)),
          #                       n=7, style='fisher')$brks
          breaks=c(0,.049, .108, .178, .230, .519, .958, 1.31))
}




