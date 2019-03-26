library(SitesInterest)


### Name: plot.displacement
### Title: Plots the displacement from a particular point over a chosen
###   window
### Aliases: plot.displacement
### Keywords: Plots

### ** Examples

##Load the data
data(OU_14)
t=unlist(OU_14["t"])
X=unlist(OU_14["X"])
Y=unlist(OU_14["Y"])

class(X) = "displacement"
class(Y) = "displacement"

##Plot the displacement from the starting point (t=0) for t=0 to t=2.9999
plot(X, Y, "OU14", t, 0.3, 0, 0, 2.9999)



