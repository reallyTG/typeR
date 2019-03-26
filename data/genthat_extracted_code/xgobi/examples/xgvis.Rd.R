library(xgobi)


### Name: xgvis
### Title: XGvis: Interactive Multidimensional Scaling Using XGobi for
###   Display
### Aliases: xgvis
### Keywords: dynamic multivariate

### ** Examples

data(morsecodes) ## from the XGobi/XGvis data, see  ?morsecodes
mc.row <- paste(morsecodes.row[,1],morsecodes.row[,2])

xgvis(dmat = morsecodes.dist,
      pos = morsecodes.pos,
      rowlab = mc.row,
      colors = morsecodes.colors,
      glyphs = morsecodes.glyphs,
      lines = morsecodes.lines,
      linecolors = morsecodes.linecolors)

##>   2) Show lines by hitting "l" with the mouse over the plot.
##>   3) Examine morsecode labels by hitting "i" and mousing around on the plot.
##>   3b) Press "r" (on the plot) to switch 3D rotation in xgobi.
##>   4) Run MDS in 3D by clicking "Run MDS" (in xgvis).
##>   5) Speed up the optimization by increasing the "Stepsize" with the slider.
##>      The "Stress function" value may go as low as 0.1925 (MM).
##>   6) When the optimization calms down, click "Run MDS" to toggle MDS off.
##>   7) Rotate the MDS configuration in 3D {by "r" with mouse over plot}.
##>   8) Increase the rotation speed with the slider in the top left and
##>      control the rotation direction by dragging the mouse on the plot.
##>   9) You can check out the initial configuration by

## In order to have no color warning :
Mcolors <- unique(morsecodes.colors)
(Mcolors <- paste("*brushColor", 0:(length(Mcolors)-1),": ", Mcolors, sep=""))

xgobi(morsecodes.pos, collab = morsecodes.col, rowlab = mc.row,
      colors = morsecodes.colors,
      glyphs = morsecodes.glyphs,
      lines  = morsecodes.lines,
      linecolors = morsecodes.linecolors,
      resources= c("*showLines: True", Mcolors))

##>      This XGobi window will be linked with
##>      the XGvis window for glyph-color brushing and labeling.



