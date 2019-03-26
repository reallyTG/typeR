library(seawaveQ)


### Name: IllRivValleyCty
### Title: Water-quality data for 05586100 Illinois River at Valley City,
###   Ill.
### Aliases: IllRivValleyCty
### Keywords: datasets datasets

### ** Examples

data(swData)

# summary of water-quality concentrations
apply(IllRivValleyCty[,grep("P[[:digit:]]", 
dimnames(IllRivValleyCty)[[2]])], 2, summary)

# simple boxplot of water-quality concentrations
rosBoxPlot(IllRivValleyCty)

# same boxplot function with many additional plotting arguments
rosBoxPlot(IllRivValleyCty, 
           site="05586100 Illinois River at Valley City, Ill.", log="y", 
           yaxt="n", ylim=c(0.0000001, 1), qwcols=c("R", "P"), 
           ylab=c("Concentration, micrograms per liter"), col="skyblue1", 
           cex.axis=0.7, cex.sub=0.8, par(tcl=0.5, las=1, 
                                                        yaxs="i", 
                                                        mgp=c(3,0.5,0), 
                                                        mar=c(5,5,2,2),
                                                        cex.main=0.9))
axis(2, at=c(0.0000001, 0.000001, 0.00001, 0.0001, 0.001, 0.01, 0.1, 1), 
     labels=c("0.0000001", "0.000001", "0.00001", "0.0001", "0.001", "0.01", 
              "0.1", "1"), cex.axis=0.7)

# scatter plot of simazine concentrations
cenScatPlot(IllRivValleyCty, pname="04035")

# scatter plot with many additional plotting arguments
par(las=1, tcl=0.5)
cenScatPlot(IllRivValleyCty, pname="04035", 
            site="05586100 Illinois River at Valley City, Ill.",
            ylabel="Simazine concentration, in micrograms per liter", 
            legcex=0.7, 
            ylim=c(0,0.4), yaxs="i", cex.lab=0.9, cex.axis=0.9,
            xlim=c(as.Date("1996-01-01"), as.Date("2012-01-01")), 
            xaxs="i", xaxt="n")
axdates<-c("1996-01-01", "2000-01-01", "2004-01-01", "2008-01-01",
           "2012-01-01")
axis(1, as.Date(axdates), labels=c("1996", "2000", "2004", "2008",
                                   "2012"), cex.axis=0.9)

# Prometon scatter plot
cenScatPlot(IllRivValleyCty, pname="04037", 
            site="05586100 Illinois River at Valley City, Ill.",
            ylabel="Prometon concentration, in micrograms per liter", 
            legcex=0.7, 
            ylim=c(0,0.06), yaxs="i", cex.lab=0.9, cex.axis=0.9,
            xlim=c(as.Date("1996-01-01"), 
                   as.Date("2012-01-01")), xaxs="i", 
            xaxt="n")
axdates<-c("1996-01-01", "2000-01-01", "2004-01-01", "2008-01-01", 
           "2012-01-01")
axis(1, as.Date(axdates), labels=c("1996", "2000", "2004", "2008",
                                               "2012"), cex.axis=0.9)

# Metribuzin scatter plot
cenScatPlot(IllRivValleyCty, pname="82630", 
            site="05586100 Illinois River at Valley City, Ill.",
            ylabel="Metribuzin concentration, in micrograms per liter", 
            legcex=0.7, 
            ylim=c(0,0.3), yaxs="i", cex.lab=0.9, cex.axis=0.9,
            xlim=c(as.Date("1996-01-01"), 
                   as.Date("2012-01-01")), xaxs="i", 
            xaxt="n")
axdates<-c("1996-01-01", "2000-01-01", "2004-01-01", "2008-01-01", 
           "2012-01-01")
axis(1, as.Date(axdates), labels=c("1996", "2000", "2004", "2008",
                                               "2012"), cex.axis=0.9)
# EPTC scatter plot
cenScatPlot(IllRivValleyCty, pname="82668", 
            site="05586100 Illinois River at Valley City, Ill.",
            ylabel="EPTC concentration, in micrograms per liter", 
            legcex=0.7, ylim=c(0,0.08), yaxs="i", cex.lab=0.9, 
            cex.axis=0.9, xlim=c(as.Date("1996-01-01"), 
                   as.Date("2012-01-01")), xaxs="i", xaxt="n")
axdates<-c("1996-01-01", "2000-01-01", "2004-01-01", "2008-01-01", 
           "2012-01-01")
axis(1, as.Date(axdates), labels=c("1996", "2000", "2004", "2008","2012"), 
     cex.axis=0.9)



