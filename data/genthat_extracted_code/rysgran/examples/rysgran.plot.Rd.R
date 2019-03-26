library(rysgran)


### Name: rysgran.plot
### Title: Generates a Bivariated Plot
### Aliases: rysgran.plot

### ** Examples


library(rysgran)
data(camargo2001)
data(sed.phi)

# Plot Mean and Sorting

rysgran.plot ("mean", "sort", data=camargo2001, output="phi", method="folk")


# Using show.labels

rysgran.plot("mean" , "sort" , data=camargo2001 , method="folk",
	show.labels = TRUE,	labels = NULL)


# Skewness and Kurtosis with label.points

rysgran.plot ("skew" , "kurt" , data=camargo2001, output="phi",
	method="folk", show.labels = FALSE, labels = NULL,
	label.points = TRUE, pch = 19, col.labels = "black",
	col = "blue", cex.labels = 1,	cex.points = 1, pos=1)


# Mean and Sorting with Kurtosis as bubbles
# Calculating the grain size statistics
rys <- gran.stats(camargo2001, method="folk")

# Plotting
rysgran.plot ("mean" , "sort" , data=camargo2001, method="folk", pch = 21, 
	col = "red", z=rys$Kurtosis, z.cex.range=c(1,3),bg="red")

# Plotting the legend
legend.bubbles ("bottomright", z=rys$Kurtosis , nleg=3, pch=21, col="black", 
	z.cex.range=c(1,3), x.intersp=1.3, y.intersp=1.3, digits=1, title="Kurtosis")


# Mean and Sorting with Skewness as bubbles for different environments
# Calculating the grain size statistics
rys <- gran.stats(sed.phi, method="folk")
env<- as.factor(rep(c("River","Tidal Flat","Subtidal","Beach"),each=10))

# Plotting
rysgran.plot ("mean" , "sort" , data=sed.phi, method="folk", pch = 19, 
	col = c("red","blue","black","brown")[env], z=rys$Skewness, z.cex.range=c(1,3))

# Plotting the legends
legend.bubbles ("bottomright", z=rys$Skewness , nleg=3, pch=21, col="black", 
	z.cex.range=c(1,3), x.intersp=1.3, y.intersp=1.3, digits=1, title="Skewness")

legend ("bottomleft", c("Beach","River","Subtidal","Tidal Flat"),
	pch=15, col=c("red","blue","black","brown"))



