library(vudc)


### Name: qddplot
### Title: Quantile Difference Diagram
### Aliases: qddplot
### Keywords: dplot

### ** Examples

# Using default settings with random data.
qddplot(rnorm(100, 30, 50), rnorm(200, 10, 10));

# remove.ratio = 0.0 means the outliers are not removed.
qddplot(rnorm(100, 30, 50), rnorm(200, 10, 10), remove.ratio=0.0);

# remove.ratio = 0.25 means only the middle half is displayed, the upper and lower quantile are not.
qddplot(rnorm(100, 30, 50), rnorm(200, 10, 10), remove.ratio=0.25);

# Illustrating similar and different medians and variances on 4 quantile difference diagrams.
# This is also an illustration for setting custom main title and subtitle.
dataSetA <- seq(-20, 20) + rnorm(41);
dataSetB <- seq(-15, 25) + rnorm(41);
dataSetC <- seq(-40, 40) + rnorm(81);
dataSetD <- seq(-20, 20) + rnorm(41);
op <- par(mfrow=c(2,2));
qddplot(
	dataSetA, 
	dataSetD, 
	main = "Similar median, similar variance",
	sub = "-20...20 vs. -20...20");
qddplot(
	dataSetA, 
	dataSetB, 
	main = "Different median, similar variance",
	sub = "-20...20 vs. -15...25");
qddplot(
	dataSetA, 
	dataSetC, 
	main = "Similar median, different variance",
	sub = "-20...20 vs. -40...40");
qddplot(
	dataSetB, 
	dataSetC, 
	main = "Different median, different variance",
	sub = "-15...25 vs. -40...40"); 
par(op);

# Change plot style: thicker line in red color.
qddplot(rnorm(100, 30, 50), rnorm(200, 10, 10), line.lwd=10, col="red");

# Hide axes, helper lines and captions.
qddplot(rnorm(100, 30, 50), rnorm(200, 10, 10), differences.drawzero=FALSE, 
	quantiles.drawhalf=FALSE, quantiles.showaxis=FALSE, line.lwd=1, yaxt='n', 
	main="", sub="", xlab="", ylab="");

# Do not consider minimal range.
qddplot(rnorm(100, 1, 1), rnorm(100, 2, 1), differences.rangemin=NA);

# Set an explicit range.
qddplot(rnorm(100, 0, 200), rnorm(100, 0, 200), differences.range=40);



