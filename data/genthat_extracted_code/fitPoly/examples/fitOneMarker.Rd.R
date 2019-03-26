library(fitPoly)


### Name: fitOneMarker
### Title: Function to fit multiple mixture models to signal ratios of a
###   single bi-allelic marker
### Aliases: fitOneMarker

### ** Examples

## No test: 
 # These examples run for a total of about 9 sec.

 data(fitPoly_data)

 # triploid, no specified populations
 fp <- fitOneMarker(ploidy=3, marker="mrk039",
                    data=fitPoly_data$ploidy3$dat3x)

 # tetraploid, specified populations
 # plot of the fitted model saved in tempdir()
 fp <- fitOneMarker(ploidy=4, marker=2,
                    data=fitPoly_data$ploidy4$dat4x,
                    population=fitPoly_data$ploidy4$pop4x,
                    pop.parents=fitPoly_data$ploidy4$pop.par4x,
                    plot="fitted",
                    plot.dir=paste0(tempdir(),"/fpPlots4x"))

 # hexaploid, specified populations, start values for means,
 # plot of the fitted model saved in tempdir()
 fp <- fitOneMarker(ploidy=6, marker=1,
                    data=fitPoly_data$ploidy6$dat6x,
                    population=fitPoly_data$ploidy6$pop6x,
                    pop.parents=fitPoly_data$ploidy6$pop.par6x,
                    startmeans=fitPoly_data$ploidy6$startmeans6x,
                    plot="fitted", plot.dir=paste0(tempdir(),"/fpPlots6x"))
## End(No test)




