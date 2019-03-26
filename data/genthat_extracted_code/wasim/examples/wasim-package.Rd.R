library(wasim)


### Name: wasim-package
### Title: Visualisation and analysis of output files of the hydrological
###   model WASIM
### Aliases: wasim-package wasim
### Keywords: hplot utilities package

### ** Examples


  unzip(system.file("weisseritz.zip", package="wasim"))

d.datum <- read.dates(file= "weisseritz/qgesww100.txt")  # Datumsreihe heisst jetzt d.datum
d.wasim.out <- read.results("", "weisseritz",ts.length=21937,subcatchments=2, ending="ww100.txt")    # Datensatz heisst jetzt d.wasim.out 
d.meas.all<-read.table("weisseritz/ww100-rh.txt",header=TRUE, na.strings ="999", skip=4)  # gemessene Daten einlesen
d.meas<-d.meas.all$Ammelsdorf[69716:91652]
p.storage(d.wasim.out, xdata=d.datum, measured=d.meas)

sd.grid <- read.grid( file= "weisseritz/sd__ww100.grd")  # Datumsreihe heisst jetzt d.datum
p.grid(sd.grid, 
        color.palette=topo.colors,
	      zlim=c(-20,20),
        main="Saturation deficit at the Weisseritz")

#for english x-lab in Germany/Switzerland:
Sys.setlocale(category = "LC_ALL", locale = "en")




