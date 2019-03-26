library(geneplotter)


### Name: cPlot
### Title: A plotting function for chromosomes.
### Aliases: cPlot
### Keywords: utilities

### ** Examples

   ## A bit of a hack to not have a package dependency on hgu95av2
   ## but need to fiddle w/ the warn level to not fail the example anyways.

   curWarn <- options(warn=0)
   on.exit(options(curWarn), add=TRUE)
   if (require("hgu95av2.db")) {
       z <- buildChromLocation("hgu95av2")

       if (interactive()) {
           curPar <- par(ask=TRUE)
           on.exit(par(curPar), add=TRUE)
       }

       for (sc in c("max","relative"))
           cPlot(z,c("1","5","10","X","Y"),sc)
   } else print("This example can not be run without hgu95av2 data package")



