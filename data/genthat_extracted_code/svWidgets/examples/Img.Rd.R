library(svWidgets)


### Name: Img
### Title: Manipulate image resources for the GUIs
### Aliases: imgAdd imgDel imgGet imgNames imgType imgRead imgReadPackage
###   print.guiImg
### Keywords: utilities

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D imgNames()
##D myImg <- imgAdd(system.file("gui", "logoSciViews.gif", package = "svWidgets"))
##D myImg  # Note that $Tk. is prepended to the name!
##D imgNames()
##D imgType(myImg)
##D ## Place that logo in a Tk window
##D timg <- winAdd("timg", title = "A Tk window with image", pos ="-40+20")
##D labImg <- tklabel(timg, image = imgGet(myImg), bg = "white")
##D tkpack(labImg)
##D ## When the image resource is deleted, it is not displayed any more (no error)
##D imgDel(myImg)
##D imgNames()
##D winDel("timg")
##D ## To read all image resources at once (place this in .Lib.first())
##D imgReadPackage("svWidgets")
##D imgNames()
##D rm(myImg)
## End(Not run)



