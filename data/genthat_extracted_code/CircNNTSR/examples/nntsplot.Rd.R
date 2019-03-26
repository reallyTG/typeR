library(CircNNTSR)


### Name: nntsplot
### Title: Plots the NNTS density
### Aliases: nntsplot

### ** Examples

data(Turtles_radians)
#Empirical analysis of data
Turtles_hist<-hist(Turtles_radians,breaks=10,freq=FALSE)
#Estimation of the NNTS density with 3 componentes for data
est<-nntsmanifoldnewtonestimation(Turtles_radians,3)
est
#plot the estimated density
nntsplot(est$cestimates[,2],3)
#add the histogram to the estimated density plot
plot(Turtles_hist, freq=FALSE, add=TRUE)



