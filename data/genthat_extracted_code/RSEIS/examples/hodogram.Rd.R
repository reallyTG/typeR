library(RSEIS)


### Name: hodogram
### Title: HodoGram Plot
### Aliases: hodogram
### Keywords: misc hplot

### ** Examples


data("GH")

temp <- cbind(GH$JSTR[[1]][1168:1500], GH$JSTR[[2]][1168:1500],
GH$JSTR[[3]][1168:1500])

pmolabs <- c("Vertical", "North", "East")


sx <- hodogram(temp, dt=GH$dt[1]  ,labs=pmolabs,
STAMP="Example",  COL=rainbow(100) )





