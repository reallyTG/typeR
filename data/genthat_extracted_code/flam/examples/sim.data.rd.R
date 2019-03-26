library(flam)


### Name: sim.data
### Title: Simulate Data from a Variety of Functional Scenarios
### Aliases: sim.data

### ** Examples

#See ?'flam-package' for a full example of how to use this package

#generate data to fit FLAM model with squared-error loss
set.seed(1)
data <- sim.data(n = 50, scenario = 1, zerof = 10, noise = 1)
flam.out <- flam(x = data$x, y = data$y, family = "gaussian")

#alternatively, generate data for logistic FLAM model 
#note: 'noise' argument no longer needed
data2 <- sim.data(n = 50, scenario = 1, zerof = 0, family = "binomial")
flam.logistic.out <- flam(x = data2$x, y = data2$y, family = "binomial")


#vary generating functions
#choose large n because we want to plot generating functions
data1 <- sim.data(n = 500, scenario = 1, zerof = 0)
data2 <- sim.data(n = 500, scenario = 2, zerof = 0)
data3 <- sim.data(n = 500, scenario = 3, zerof = 0)
data4 <- sim.data(n = 500, scenario = 4, zerof = 0)
#and plot to see functional forms
par(mfrow=c(2,2))
col.vec = c("dodgerblue1","orange","seagreen1","hotpink")
for (i in 1:4) {
	if (i==1) data = data1 else if (i==2) data = data2 
		else if (i==3) data = data3 else data = data4
	plot(1,type="n",xlim=c(-2.5,2.5),ylim=c(-3,3),xlab=expression(x[j]),
		ylab=expression(f[j](x[j])),main=paste("Scenario ",i,sep=""))
	sapply(1:4, function(j) points(sort(data$x[,j]), 
		data$theta[order(data$x[,j]),j],col=col.vec[j],type="l",lwd=3))
}

#include large number of predictors that have no relationship to outcome
data <- sim.data(n = 50, scenario = 1, zerof = 100, noise = 1)



