library(RSEIS)


### Name: PMOT.drive
### Title: Interactive Particle Motion Plot
### Aliases: PMOT.drive
### Keywords: misc iplot

### ** Examples


data("GH")
sel <-  which(GH$STNS == "CE1")


YMAT  <-  cbind(GH$JSTR[[sel[1]]][1168:1500],
GH$JSTR[[sel[2]]][1168:1500],
GH$JSTR[[sel[3]]][1168:1500])

dt  <-   GH$dt[ sel[1] ]
ftime  <-  Zdate(GH$info, sel[1], 1)

## Not run: 
##D PMOT.drive(YMAT, dt, pmolabs = c("Vertical", "North", "East"),
##D STAMP =ftime )
##D 
## End(Not run)





