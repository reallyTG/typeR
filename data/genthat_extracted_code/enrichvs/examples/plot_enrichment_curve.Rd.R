library(enrichvs)


### Name: plot_enrichment_curve
### Title: Function to plot a enrichment curve for virtual screening
### Aliases: plot_enrichment_curve

### ** Examples

data(dud_egfr)
x <- rnorm( 88888 )                        # virtual scores for 1000 compounds
y <- c(rep(1,88), rep(0,88800))            # activity labels for "x"
plot_enrichment_curve(x, y, col="blue")

plot_enrichment_curve(dud_egfr$energy, dud_egfr$label, 
	add=TRUE, decreasing=FALSE, col="red") # Add a plot
legend("bottomrigh", legend = c("ideal", "random", "score1", "score2"),
	lty=c(2,3,1,1), col=c("black", "grey", "blue", "red"), bty="n")




