library(wasim)


### Name: p.storage
### Title: Plot flow components / storage fillage / balance (integrals) of
###   WaSiM model run
### Aliases: p.storage p.flow_comp p.balance
### Keywords: utilities hplot

### ** Examples

  unzip(system.file("weisseritz.zip", package="wasim"))
d.datum <- read.dates(file= "weisseritz/qgesww100.txt")  # Datumsreihe heisst jetzt d.datum
d.wasim.out <- read.results("", "weisseritz",ts.length=21937,subcatchments=2, ending="ww100.txt")    # Datensatz heisst jetzt d.wasim.out 
d.meas.all<-read.table("weisseritz/ww100-rh.txt",header=TRUE, na.strings ="999", skip=4)  # gemessene Daten einlesen
d.meas<-d.meas.all$Ammelsdorf[69716:91652]
p.storage(d.wasim.out, xdata=d.datum, measured=d.meas)



