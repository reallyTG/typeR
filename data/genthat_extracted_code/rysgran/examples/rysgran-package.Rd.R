library(rysgran)


### Name: rysgran-package
### Title: Grain size analysis, textural classifications and distribution
###   of unconsolidated sediments
### Aliases: rysgran-package rysgran
### Keywords: package

### ** Examples


library (rysgran)
data (camargo2001)
data(sed.phi)
data(sed.metric)

#grain size analysis using Folk & Ward with verbal classification
gran.stats (camargo2001, method="folk" , verbal=TRUE)


#grain size analysis using Method of Moments with verbal classification
gran.stats (sed.metric, method="moment" , verbal=TRUE)


#weight percentages
class.percent (camargo2001, mode="total")


#histograms
rysgran.hist (camargo2001)


#bivariated plot
rysgran.plot ("mean" , "sort" , data = camargo2001, method="folk", pch=19)


#ternary diagram of Shepard
percent <- class.percent(camargo2001, mode="total")
x<-percent[2:4]
rysgran.ternary  (x, method= "shepard", pch=19)



