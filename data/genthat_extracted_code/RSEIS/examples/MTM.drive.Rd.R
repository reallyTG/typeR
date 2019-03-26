library(RSEIS)


### Name: MTM.drive
### Title: Interactive MTM driver
### Aliases: MTM.drive
### Keywords: misc iplot

### ** Examples


data("GH")
sel <-  which(GH$COMPS=="V")

amp  <-  list()
dees  <-  list()
stamps  <-  list()

for( i in 1:3)
{
amp[[i]]  <-  GH$JSTR[[sel[i]]]
dees[i]  <-  GH$dt[sel[i]]
stamps[i]  <-  paste(GH$STNS[sel[i]], GH$COMPS[sel[i]])
}

 a  <-  list(y=amp, dt=dees, stamps=stamps)


 f1  <-  0.1

f2  <-  floor(0.33*(1/a$dt[[1]]))

speccol   <-  c('red', 'blue', 'purple')


MTM.drive(a, f1, f2, COL=speccol, PLOT=TRUE)





