library(openintro)


### Name: gradesTV
### Title: Simulated data for analyzing the relationship between watching
###   TV and grades
### Aliases: gradesTV
### Keywords: datasets, correlation, regression

### ** Examples

data(gradesTV)
str(gradesTV)

plot(gradesTV)
makeTube(gradesTV$TV, gradesTV$Grades, 1.5, type='robust', homosk=FALSE)

lmPlot(gradesTV$TV, gradesTV$Grades, xAxis=4, xlab='time watching TV',
	yR=0.2, highlight=c(1,15,20))



