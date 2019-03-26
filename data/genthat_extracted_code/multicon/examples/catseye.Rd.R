library(multicon)


### Name: catseye
### Title: Cat's Eye
### Aliases: catseye
### Keywords: graphing distributions

### ** Examples

  # A Single Group
f <- rnorm(50)
catseye(f, conf=.95, xlab="", ylab="DV", las=1)
catseye(f, conf=.95, xlab="", ylab="DV", las=1, col="light green",
	 main="Cat's Eye Plot for a Single Group Mean", sub="95 percent CI")

  # Two Groups
f2 <- rnorm(100)
g <- rep(1:2, each=50)
catseye(f2, grp=g, xlab="Conditions", ylab="DV", 
	grp.names=c("Control", "Experimental"), las=1)
catseye(f2, grp=g, conf=.8, xlab="", ylab="DV", 
	grp.names=c("Control", "Experimental"), las=1, col="cyan", 
	main="Two Group Mean Comparison", sub="80 percent CIs")
  
  # Three Groups
f3 <- c(rnorm(10), rnorm(10, mean=.5), rnorm(10, mean=1, sd=2))
g2 <- rep(1:3, each=10)
catseye(f3, grp=g2, conf=.95, xlab="Conditions", ylab="DV", 
	grp.names=c("Group 1", "Group 2", "Group 3"), las=1, col="cyan",
	main="Three Group Mean Comparison")

  # A 2 x 2 Design
f4 <- rnorm(200)
fac1 <- rep(1:2, each=100)
fac2 <- rep(3:4, 100)
catseye(f4, list(fac1, fac2), xlab="Conditions", ylab="DV", 
	grp.names=c("High/High", "High/Low", "Low/High", "Low/Low"),las=1, 
	col="orange", main="A 2 x 2 Experiment Comparison")
  # Using the xpoints argument to create visual space
catseye(f4, list(fac1, fac2), xlab="Conditions", ylab="DV", 
	grp.names=c("High/High", "High/Low", "Low/High", "Low/Low"),xpoints=c(1,2,4,5), 
	las=1, col="orange", main="A 2 x 2 Experiment Comparison")

  # A 2 x 3 Design
f5 <- rnorm(180)
fac1 <- rep(1:2, each=90)
fac2 <- rep(3:5, 60)
catseye(f5, list(fac1, fac2), xlab="Conditions", ylab="DV", 
	grp.names=c("High/A", "High/B", "High/C", "Low/A", "Low/B","Low/C"), 
	las=1, main="A 2 x 3 Experiment Comparison")
  # Using the xpoints argument to create visual space
catseye(f5, list(fac1, fac2), xlab="Conditions", ylab="DV", 
	grp.names=c("High/A", "High/B", "High/C", "Low/A", "Low/B","Low/C"), 
	xpoints=c(1,2,3,5,6,7), las=1, main="A 2 x 3 Experiment Comparison")



