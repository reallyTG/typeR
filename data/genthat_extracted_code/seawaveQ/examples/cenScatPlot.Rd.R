library(seawaveQ)


### Name: cenScatPlot
### Title: Scatter plot of water-quality data
### Aliases: cenScatPlot
### Keywords: hplot

### ** Examples

data(swData)
# scatter plot of Simazine concentrations
cenScatPlot(IllRivValleyCty, pname="04035")
# scatter plot with many additional plotting arguments
par(las=1, tcl=0.5)
cenScatPlot(IllRivValleyCty, pname="04035",
            site="05586100 Illinois River at Valley City, IL",
            ylabel="Simazine concentration, in micrograms per liter",
            legcex=0.7, ylim=c(0,0.4), yaxs="i", cex.lab=0.9,
            cex.axis=0.9, xlim=c(as.Date("1996-01-01", "%Y-%m-%d"),
            as.Date("2012-01-01", "%Y-%m-%d")), xaxs="i", xaxt="n")
axdates<-c("1996-01-01", "2000-01-01", "2004-01-01", "2008-01-01",
           "2012-01-01")
axis(1, as.Date(axdates, "%Y-%m-%d"),
     labels=c("1996", "2000", "2004", "2008", "2012"), cex.axis=0.9)



