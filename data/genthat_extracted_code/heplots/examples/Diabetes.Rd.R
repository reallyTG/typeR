library(heplots)


### Name: Diabetes
### Title: Diabetes Dataset
### Aliases: Diabetes
### Keywords: datasets

### ** Examples

data(Diabetes)
col <- c("blue", "red", "darkgreen")[Diabetes$group]
pch <- c(16,15,17)[Diabetes$group]

# a perplexing plot, similar to Fig 2, but with a loess smooth 
plot(instest ~ glutest, data=Diabetes, pch=16,
	cex.lab=1.25,
	xlab="Glucose area (glutest)",
	ylab="Insulin area (instest)")
lines( loess.smooth(Diabetes$glutest, Diabetes$instest), col="blue", lwd=2) 

# scatterplot matrix, colored by group
plot(Diabetes[,1:5], col=col, pch=pch)

# covariance ellipses
covEllipses(Diabetes[,2:5], Diabetes$group, fill=TRUE, pooled=FALSE, 
	col=col)

covEllipses(Diabetes[,2:5], Diabetes$group, fill=TRUE, pooled=FALSE, 
	col=col, variables=1:4)

# Box's M test
diab.boxm <- boxM(Diabetes[,2:5], Diabetes$group)
diab.boxm
plot(diab.boxm)

# heplots
diab.mlm <- lm(cbind(glufast, glutest, instest, sspg) ~ group, data=Diabetes)

heplot(diab.mlm)
pairs(diab.mlm, fill=TRUE, fill.alpha=0.1)





