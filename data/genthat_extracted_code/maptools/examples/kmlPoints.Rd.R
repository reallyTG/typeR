library(maptools)


### Name: kmlPoints
### Title: Create and write a KML file on the basis of a given Points
###   object
### Aliases: kmlPoints
### Keywords: spatial

### ** Examples

data(SplashDams)
num <- length(SplashDams)
td <- tempdir()
kmlfile <- paste(td, "OregonSplashDams.kml", sep="/")
kmlname <- "Oregon Splash Dams"
kmldescription <- paste("Data for Splash Dams in western Oregon.",
 "See http://www.fs.fed.us/pnw/lwm/aem/people/burnett.html#projects_activities",
 "for more information.")
icon <- "http://www.gstatic.com/mapspro/images/stock/962-wht-diamond-blank.png"
name <- paste("Dam on",SplashDams$streamName)
description <- paste("<b>owner:</b>", SplashDams$owner, "<br><b>dates:</b>", SplashDams$datesUsed)

kmlPoints(SplashDams, kmlfile=kmlfile, name=name, description=description,
          icon=icon, kmlname=kmlname, kmldescription=kmldescription)



