library(geneplotter)


### Name: alongChrom
### Title: A function for plotting expression data from an ExpressionSet
###   for a given chromosome.
### Aliases: alongChrom buildACMainLabel doACImagePlot fixACPhysPoints
###   getACGeneSyms limitACXRange cullACXPoints doACLocalPlot
###   getACClosestPos getACPlotLabs scaleACData dispACXaxis doACMatPlot
###   getACDataEnv getACStrandVals doACCumPlot emptyACPlot getACExprs
###   highlightACDups
### Keywords: utilities

### ** Examples

   data(sample.ExpressionSet)
   ## A bit of a hack to not have a package dependency on hgu95av2
   ## but need to fiddle w/ the warn level to not fail the example anyways.
   curWarn <- options(warn=0)
   on.exit(options(curWarn), add=TRUE)
   if (require("hgu95av2.db")) {
      z <- buildChromLocation("hgu95av2")
      lty <- c(1, 2, 3, 4, 5)
      cols <- c("red", "green", "blue", "orange", "magenta", "black")
      cols <- cols[sample.ExpressionSet$type]
      if (interactive()) {
         par(ask=TRUE)
      }

      ## Here we're using xlim to denote a physical region to display
      xlim <- c(87511280,127717880)
      for (xl in c("equispaced", "physical"))
        for (sc in c("none","rangescale"))
        {
           alongChrom(sample.ExpressionSet, "1", z, xlim=xlim, xloc=xl,
              plotFormat="cumulative", scale=sc,lty=lty, colors=cols)
        }

     ## Here we're looking for specific genes
     which <- c("31540_at","31583_at", "31508_at", "31529_at", "31439_f_at",
               "31729_at")
     ## Gene "31529_at" does not exist in the current set of genes,
     ## here it demonstrates how genes not available are dropped.
      for (xl in c("equispaced", "physical"))
        for (sc in c("none","rangescale"))
        {
            alongChrom(sample.ExpressionSet, "1", z, which=which, xloc=xl,
               plotFormat="cumulative", scale=sc,lty=lty, col=cols)
         }

      ## Do an image plot
      for (bs in c(TRUE,FALSE))
         alongChrom(sample.ExpressionSet, "1",z, xlim=xlim, plotFormat="image",
                   scale="zscale", byStrand=bs)

      ## A boxplot
      for (st in c(TRUE,FALSE))
         alongChrom(sample.ExpressionSet, "1", z, plotFormat="local",
                    colors=cols, byStrand=st)
    } else print("Example can not be run without the hgu95av2 data package")



