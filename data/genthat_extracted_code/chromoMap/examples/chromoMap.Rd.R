library(chromoMap)


### Name: chromoMap
### Title: render interactive chromosome plots
### Aliases: chromoMap

### ** Examples


library(chromoMap)
data("pancandata")
#dataset contains two data
#view data set
head(pancandata$data1)
head(pancandata$data2)

#plotting simple annotation
chromoMap(pancandata$data1)

#plotting heatmap-single
chromoMap(pancandata$data1,type="heatmap-single")

#plotting heatmap double
chromoMap(pancandata$data2,type="heatmap-double")

#change orientation of plot
chromoMap(pancandata$data1,align="vertical")

#change chromosome color
chromoMap(pancandata$data1,chCol="green",chBorder="green")

#change chromosome plot background and text color
chromoMap(pancandata$data2,type="heatmap-double",textCol="white",bgCol="black")








