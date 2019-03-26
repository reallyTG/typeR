library(PBSmapping)


### Name: addBubbles
### Title: Add Bubbles to Maps
### Aliases: addBubbles
### Keywords: aplot

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- common code for both examples below
  data(nepacLL,surveyData,envir=.PBSmapEnv)
  surveyData$Z <- surveyData$catch

  #--- plot a version that only varies the size
  plotMap(nepacLL, xlim=c(-131.8,-127.2), ylim=c(50.5,52.7),
    col="gainsboro",plt=c(.08,.99,.08,.99))
  addBubbles(surveyData, symbol.bg=rgb(.9,.5,0,.6),
    legend.type="nested", symbol.zero="+", col="grey")

  #--- plot a version that uses different symbol colours
  plotMap(nepacLL, xlim=c(-131.8,-127.2), ylim=c(50.5,52.7),
  col="gainsboro",plt=c(.08,.99,.08,.99))
  subset <- surveyData[surveyData$Z <= 1000, ]
  addBubbles(subset, symbol.bg=c("red", "yellow", "green"),
    legend.type="horiz", legend.breaks=pretty(range(subset$Z), n=11),
    symbol.zero=FALSE, col="grey", min.size=0.1, max.size=0.4)
  par(oldpar)
})



