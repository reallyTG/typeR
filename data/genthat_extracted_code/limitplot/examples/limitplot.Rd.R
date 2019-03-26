library(limitplot)


### Name: limitplot
### Title: Jitter/CI Plot with Ordered Points Below the Limit of Detection
### Aliases: limitplot
### Keywords: hplot

### ** Examples

## Create a basic limitplot with four different categories 
## from log-normally distributed data and set the limit of detection to 0.35:
conc<-rlnorm(150,0.5,5)
category<-sample(4,150,replace=TRUE)
limitplot(conc[category==1],conc[category==2], 
	conc[category==3], conc[category==4], 
	lod = 0.35, log = "y")

## Add labels and change the graphical parameters:
limitplot(conc[category==1], conc[category==2], 
	conc[category==3], conc[category==4], 
	lod = 0.35, log = "y", 
	ylab = "Bla g 2 (ug/g)", xlab = "Report of Cockroach in homes", 
	names = c("Never","Rarely","Weekly","Daily"), 
	main = "Exposure to Cockroach in homes", 
	size = 0.5, shape = 16, 
	jittersize = 0.5, jittershape = 16, jittercol = "red")



