library(qcr)


### Name: qcs.one
### Title: Function to plot the Shewhart xbar.one chart
### Aliases: qcs.one qcs.one.default qcs.one.qcd

### ** Examples


##
##  Continuous data 
##
library(qcr)
x <- c(33.75, 33.05, 34, 33.81, 33.46, 34.02, 33.68, 33.27, 33.49, 33.20,
      33.62, 33.00, 33.54, 33.12, 33.84)

sample <- 1:length(x)
datos <- data.frame(x,sample)
datos.qcd <- qcd(datos)

res.qcs <- qcs.one(datos.qcd)
class(res.qcs)
summary(res.qcs)  
 plot(res.qcs, title = "Control Chart Xbar.one for pistonrings")  




