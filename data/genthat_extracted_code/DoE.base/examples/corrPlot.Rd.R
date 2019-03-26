library(DoE.base)


### Name: corrPlot
### Title: Function to Visualize Correlations Between Model Matrix Columns
###   for an Experimental Design
### Aliases: corrPlot
### Keywords: design

### ** Examples

## this is with the default contr.XuWu recoding
mat <- corrPlot(VSGFS)
round(mat, 2)

## NOT RECOMMENDED: force-keep non-normalized coding
corrPlot(VSGFS, recode=FALSE)  # not useful!

## custom normalized orthogonal coding
## that has correlations more concentrated on fewer columns
plan <- change.contr(VSGFS, "contr.XuWuPoly")
contrasts(plan$CDs) <- contr.FrF2(4)
corrPlot(plan, recode=FALSE)  # that is the purpose of recode=FALSE

corrPlot(VSGFS, main.only=FALSE, three=TRUE, cex.x=0.5, cex.y=0.5, split=100)



