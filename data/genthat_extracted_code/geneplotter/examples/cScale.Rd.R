library(geneplotter)


### Name: cScale
### Title: A function for mapping chromosome length to a number of points.
### Aliases: cScale
### Keywords: utilities

### ** Examples

   ## A bit of a hack to not have a package dependency on hgu95av2
   ## but need to fiddle w/ the warn level to not fail the example anyways.
   curWarn <- options(warn=0)
   on.exit(options(warn), add=TRUE)
   if (require("hgu95av2.db")) {
      z <- buildChromLocation("hgu95av2")

     for (sc in c("max","relative"))
       scale <- cScale(1000, chromLengths(z),sc,"Y")
   } else print("This example needs the hgu95av2 data package")



