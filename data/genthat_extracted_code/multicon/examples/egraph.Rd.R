library(multicon)


### Name: egraph
### Title: Plotting Summary Statistics with Error Bars
### Aliases: egraph
### Keywords: descriptive statistics plot

### ** Examples

	#Making some random data
y <- rnorm(100)
x <- rep(c(1,2),50)
z <- c(1,rep(c(1,2,3),33))
zz <- rep(c(1:4),25)
x2 <- rep(1:2, each=50)
	#plotting
egraph(y)
egraph(y, xlab="", ylab="DV", las=1)
egraph(y, x, xlab="Conditions", ylab="DV", las=1)
egraph(y, z, xlab="Conditions", ylab="DV", las=1)
egraph(y, zz, xlab="", ylab="DV", las=1, font.main=1, 
	main="my title", sub="Arms Indicate 95 percent CIs")
egraph(y, zz, xlab="Conditions", ylab="DV", las=1, font.main=1, 
	main="my title", xpoints=c(1,1.5, 4,4.5),grp.names=c("A","B", "C", "D"), 
	sub="Arms Indicate 95 percent CIs", sides=1)



