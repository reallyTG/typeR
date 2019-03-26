library(enrichvs)


### Name: plot_enrichment_curve_xlog
### Title: Function to plot a enrichment curve with a logarithmic scale on
###   the x axis
### Aliases: plot_enrichment_curve_xlog

### ** Examples

data(dud_egfr)
x <- rnorm( 88888 )                        # virtual scores for 1000 compounds
y <- c(rep(1,88), rep(0,88800))            # activity labels for "x"
plot_enrichment_curve_xlog(x, y, col="blue")

plot_enrichment_curve_xlog(dud_egfr$energy, dud_egfr$label, 
	add=TRUE, decreasing=FALSE, col="red") # Add a plot
legend("topleft", legend = c("ideal", "random", "score1", "score2"),
	lty=c(2,3,1,1), col=c("black", "grey", "blue", "red"), bty="n")



