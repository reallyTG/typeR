library(SRCS)


### Name: plot.SRCS
### Title: Heatmap plot of the ranking achieved by a target variable levels
###   after all statistical pairwise comparisons in multi-parameter problem
###   instances.
### Aliases: animatedplot plot.SRCS singleplot

### ** Examples

# Example from a Machine Learning problem with noisy data
	ranks = SRCSranks(ML1, params = c("Dataset", "Noise type", "Noise ratio"),
	  target = "Algorithm", performance="Performance", maximize = TRUE, ncores = 2,
	  paired = TRUE, pairing.col = "Fold");
	singleplot(ranks, yInner = "Noise type",
   xInner = "Noise ratio", Algorithm = "C4.5", Dataset = "glass")
	plot(x = ranks, yOuter = "Dataset", xOuter = "Algorithm", yInner = "Noise type",
	  xInner = "Noise ratio", out.X.par = list(levels.lab.textpar =
	  list(col = "white"), levels.bg = "black", levels.border = "white"),
	  out.Y.par = list(levels.bg = "gray"), colorbar.axes.par = list(cex.axis = 0.8),
	  show.colorbar = TRUE)
	SRCScomparison(ranks, "Algorithm", Dataset = "automobile", `Noise type` = "ATT_GAUS",
	  `Noise ratio`= 10, pvalues = FALSE)
# ---------------------------------------------------
## Not run: 
##D mat = matrix(NA, nrow = nrow(MPBall), ncol = ncol(MPBall))
##D # First, take the average of the previous performance columns up to each change point
##D for(j in 6:ncol(MPBall)){
##D   mat[,j] = rowSums(MPBall[,5:j])/(j-5+1)
##D }
##D MPBall[,6:ncol(MPBall)] = mat[,6:ncol(MPBall)]
##D 
##D ranksall = SRCSranks(MPBall, params = c("Dim", "CF", "Severity"), target="Algorithm",
##D    test = "tukeyHSD", performance=paste("OffError", seq(from=1, to = 100, by = 24),
##D    sep = "_"), maximize = FALSE, ncores = 2)
##D 
##D # Adjust argument path.to.converter to point to ImageMagick convert utility
##D animatedplot(x = ranksall, filename = "MPBconv_reduced.gif",
##D 	             path.to.converter = "C:/Program Files/ImageMagick-6.8.8-Q8/convert.exe",
##D 	             yOuter = "Algorithm", xOuter = "Dim", yInner = "CF", xInner = "Severity",
##D 	             zInner = paste0("rank",1:5), delay = 30,
##D 	             annotations = paste0("At change ",seq.int(from = 1, to = 100, by = 24)),
##D 	             inner.Y.par = list(levels.at = c("40", "200", "400", "600", "800", "1000"),
##D               lab = "Change\nfrequency", levels.loc = "left"),
##D 	             heat.cell.par = list(pty = "s"),
##D 	             inner.X.par = list(levels.at = c("2", "8", "14")),
##D 	             out.Y.par = list(levels.lab.textpar = list(cex = 1, col = "white"),
##D               levels.bg = "black", levels.border = "white"),
##D 	             out.X.par = list(lab = "Dimension", levels.bg = "gray"),
##D 	             colorbar.par = list(levels.at = c("-2", "0", "2")),
##D 	             colorbar.axes.par = list(cex.axis = 0.8),
##D 	             show.colorbar = TRUE, height = 500
##D             )
##D # The full dataset (20 MB) can be downloaded from
##D # http://decsai.ugr.es/~pjvi/SRCSfiles/MPBall.RData
##D # (the average must still be computed before plotting, just as in the example above)
##D # Check the script in http://decsai.ugr.es/~pjvi/SRCSfiles/DOPvideoScript.R
## End(Not run)



