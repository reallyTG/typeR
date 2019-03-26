library(RSEIS)


### Name: complex.hodo
### Title: HodoGram Plot
### Aliases: complex.hodo
### Keywords: misc hplot

### ** Examples


data("GH")

temp <- cbind(GH$JSTR[[1]][1168:1500], GH$JSTR[[2]][1168:1500],
GH$JSTR[[3]][1168:1500])

pmolabs <- c("Vertical", "North", "East")


sx <- complex.hodo(temp, dt=GH$dt[1]  ,labs=pmolabs,
STAMP="Example",  COL=rainbow(100) )





