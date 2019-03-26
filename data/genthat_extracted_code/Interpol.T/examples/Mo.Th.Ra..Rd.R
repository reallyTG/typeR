library(Interpol.T)


### Name: Mo.Th.Ra.
### Title: Creates a table of mean monthly "daily thermal range" (dtr)
### Aliases: Mo.Th.Ra.

### ** Examples

data(Trentino_hourly_T)
id<-"T0001"
Tmin<-data.frame(Tn[,1:3], T=Tn[,id])
Tmax<-data.frame(Tx[,1:3], T=Tx[,id])
dtr <- Mo.Th.Ra.(Tmin = Tmin, Tmax = Tmax, name = id)



