library(compositions)


### Name: compositions-package
### Title: Compositional Data Analysis
### Aliases: compositions-package compositions
### Keywords: package

### ** Examples

library(compositions)      # load library
data(SimulatedAmounts)     # load data sa.lognormals
x <- acomp(sa.lognormals)  # Declare the dataset to be compositional
                           # and use relative geometry
plot(x)                    # plot.acomp : ternary diagram
ellipses(mean(x),var(x),r=2,col="red")  # Simplex 2sigma predictive region
pr <- princomp(x)
straight(mean(x),pr$Loadings) 

x <- rcomp(sa.lognormals)  # Declare the dataset to be compositional
                           # and use absolute geometry
plot(x)                    # plot.acomp : ternary diagram
ellipses(mean(x),var(x),r=2,col="red")  # Real 2sigma predictive region
pr <- princomp(x)          
straight(mean(x),pr$Loadings) 



