library(renpow)


### Name: Wave Power
### Title: Wave Power Functions
### Aliases: wavepower generate.duration powflux.wave wave.contour
###   duration.wave energy.wave energy.gen rotate
### Keywords: hplot dplot math

### ** Examples


 Pflux <- powflux.wave(Hs=seq(1,10),Tp=seq(5,20)) 
 wave.contour(X=Pflux,label="Power flux (kW/m)")
 D <-  duration.wave(WaveHsTp,file=FALSE)
 # alternatively using file in extdata 
 #  D <- duration.wave(system.file("extdata","WaveHsTp.csv",package="renpow"))
 wave.contour(X=D,label="Duration (hrs/yr)")

 Ew <- energy.wave(Pflux,D)
 wave.contour(X=Ew,label="Energy flux (MWh/yr/m)",sum=TRUE,sumlabel="(MWh/yr/m)")
 Eg <- energy.gen(Ew,L=30,nu=0.4)
 wave.contour(X=Eg,label="Energy produced (MWh/yr)",sum=TRUE,sumlabel="(MWh/yr)")




