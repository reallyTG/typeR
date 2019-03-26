library(openair)


### Name: quickText
### Title: Automatic text formatting for openair
### Aliases: quickText
### Keywords: methods

### ** Examples



#example 1
##see axis formatting in an openair plot, e.g.:
scatterPlot(mydata, x = "no2", y = "pm10")

#example 2
##using quickText in other plots
plot(mydata$no2, mydata$pm10, xlab = quickText("my no2 label"),
     ylab = quickText("pm10 [ ug.m-3 ]"))





