library(Ridit)


### Name: ridit
### Title: Ridit Analysis
### Aliases: ridit
### Keywords: Statistics univar htest

### ** Examples


x=airquality$Ozone
g=airquality$Month
kruskal.test(x,g)
ridit(x,g)
ridit(x,g,"5")
ridit(x,g,5)




