library(openintro)


### Name: lmPlot
### Title: Linear regression plot with residual plot
### Aliases: lmPlot
### Keywords: linear model residuals

### ** Examples

data(satGPA)
lmPlot(satGPA$SATSum, satGPA$FYGPA)

data(gradesTV)
lmPlot(gradesTV$TV, gradesTV$Grades, xAxis=4,
	xlab='time watching TV', yR=0.2, highlight=c(1,15,20))



