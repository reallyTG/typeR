library(rcanvec)


### Name: canvec.qplot
### Title: Quickly Plot Canvec Data
### Aliases: canvec.qplot

### ** Examples

## No test: 
 #simplest use using searchbbox() from {prettymapr}
 library(prettymapr)
 wolfville <- searchbbox("Wolfville NS", source="google")
 canvec.qplot(bbox=wolfville)
 canvec.qplot(bbox=wolfville, layers=c("waterbody", "forest"))

 #can also plot by NTS sheet and use bbox= or xlim, ylim to zoom.
 canvec.qplot(nts("21h1"), layers=c("waterbody", "forest", "contour", "river", "road"))
 canvec.qplot(bbox=makebbox(45.1, -64.35, 45.05, -64.4), 
        layers=c("waterbody", "contour", "river", "building", "building_poly", "road"))

 #method returns plot data argument so data does not need to be loaded each time. 
 #this will not work when changing nts sheets.
 plotdata <- canvec.qplot(nts("21h1"), layers=c("waterbody", "forest", "contour", "river"))
 plotdata <- canvec.qplot(bbox=makebbox(45.1, -64.35, 45.05, -64.4), 
                        layers=c("waterbody", "contour", "river"),
                        data=plotdata)
 
 #use with prettymapr::addscalebar() and prettymapr::addnortharrow()
 library(prettymapr)
 wolfville <- searchbbox("Wolfville NS", source="google")
 canvec.qplot(bbox=wolfville)
 addscalebar()
 addnortharrow()
 
 #or use with prettymapr::prettymap() to set margins and add north arrow/
 #scalebar
 prettymap(canvec.qplot(bbox=wolfville))
 
 
## End(No test)




