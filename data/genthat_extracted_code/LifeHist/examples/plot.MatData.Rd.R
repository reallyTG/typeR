library(LifeHist)


### Name: plot.MatData
### Title: Exploratory Analisys of a Logistic Model on a Graphical Display
### Aliases: plot.MatData
### Keywords: optimize models & &nonlinear

### ** Examples

data(BlackAngler.lenmatdat)
BA.matlen     <- MatCount(matdat=BlackAngler.lenmatdat,
                          fem.key=2,
                          mal.key=1,
                          stage.key=2,
                          season.key=c(5,7))
plot(BA.matlen[[2]],pred.50=35,pred.95=55,top.text="Males Rep Season")



