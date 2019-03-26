library(ssym)


### Name: Biaxial
### Title: Brown and Miller's Biaxial Fatigue
### Aliases: Biaxial

### ** Examples

data("Biaxial", package="ssym")
plot(Biaxial$Work, Biaxial$Life, type="p",
     cex=0.3, lwd=3, ylab="Life", xlab="Work per cycle",
	 main="Brown and Miller's Biaxial Fatigue Data")



