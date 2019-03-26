library(RSEIS)


### Name: idpoints.hodo
### Title: ID points on Hodogram
### Aliases: idpoints.hodo
### Keywords: misc iplot

### ** Examples



data("GH")
sel<- which(GH$STNS == "CE1")


temp <- cbind(GH$JSTR[[sel[1]]][1168:1500],
 GH$JSTR[[sel[2]]][1168:1500], GH$JSTR[[sel[3]]][1168:1500])
dt <-  GH$dt[ sel[1] ]
STAMP <- "GH"

PMOT.drive(temp, dt,
 pmolabs = c("Vertical", "North", "East"), STAMP = STAMP)


## ids <- idpoints.hodo(temp, sx, zloc$x[sn1], zloc$y[sn1])




