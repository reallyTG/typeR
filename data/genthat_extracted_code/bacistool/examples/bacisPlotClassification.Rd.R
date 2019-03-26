library(bacistool)


### Name: bacisPlotClassification
### Title: Plot the posterior density of theta in the classification model.
### Aliases: bacisPlotClassification
### Keywords: bacistool bacistool

### ** Examples


## Compute the posterior distribution of \eqn{\theta}.
library(bacistool)
bacisPlotClassification(numGroup=5,
                            tau1=NA,
                            tau2=.001,
                            phi1=0.1, phi2=0.3,
                            clusterCutoff=NA,
                            MCNum=5000,
                            nDat=c(25,25,25,25,25),
                            xDat=c(3,4,3,8,7),
                            cols = c("brown", "red", "orange", "blue", "green")

)




