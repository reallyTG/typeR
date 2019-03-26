library(phonR)


### Name: Repulsive force
### Title: Repulsive force calculations and plots for vowel systems.
### Aliases: repulsiveForce repulsiveForceHeatmap
###   repulsiveForceHeatmapLegend
### Keywords: methods

### ** Examples

    require(plotrix)
    data(indoVowels)
    force <- with(indo[indo$subj==indo$subj[1],], 
                  repulsiveForce(f2, f1, vowel))
    colmap <- color.scale(x=0:100, cs1=c(0, 180), cs2=100, 
                          cs3=c(25, 100), color.spec='hcl')
    with(indo[indo$subj==indo$subj[1],],
        repulsiveForceHeatmap(f2, f1, type=vowel, resolution=10,
                              colormap=colmap, add=FALSE))
    xl <- rep(max(range(indo$f2)), 2)
    yl <- range(indo$f1) + c(abs(diff(range(indo$f1)) / 2), 0)
    repulsiveForceHeatmapLegend(xl, yl, colormap=colmap, useRaster=TRUE)



