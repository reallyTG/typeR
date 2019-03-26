library(mapReasy)


### Name: plotonMAP
### Title: Comparison of different factors on administrative map with bar
###   and pie charts
### Aliases: plotonMAP
### Keywords: Bar chart on map Pie chart on map Comparison on map

### ** Examples


filePATH <- system.file("Bangladesh", package="mapReasy")

dat <- data.frame(region=c("Dhaka","Khulna","Sylhet"),
baseline=c(10,20,30),endline=c(20,20,15))

plotonMAP(shapedir=filePATH, shapename="BGD_adm1",boundary.label="NAME_1",all.label
=TRUE,plot.type="bar",plot.data=dat,plot.col=c("red","green"),plot.label.col
="red",plot.size=c(0.6,0.6))




