library(seawaveQ)


### Name: qwMoRivOmaha
### Title: Water-quality data for 06610000 Missouri River at Omaha, Nebr.
### Aliases: qwMoRivOmaha
### Keywords: datasets datasets

### ** Examples

  data(swData)
  
  # summary of water-quality concentrations
  apply(qwMoRivOmaha[,grep("P[[:digit:]]",dimnames(qwMoRivOmaha)[[2]])], 
  2, summary)
  
  # simple boxplot of water-quality concentrations
  rosBoxPlot(qwMoRivOmaha, qwcols=c("R", "P"))
  
  # same boxplot function with many additional plotting arguments
  rosBoxPlot(qwMoRivOmaha, site="06610000 Missouri River at Omaha, Nebr.", 
             log="y", yaxt="n", ylim=c(0.000001, 10), qwcols=c("R", "P"),
             ylab=c("Concentration, micrograms per liter"), col="skyblue1", 
             cex.axis=0.7, cex.sub=0.8, par(tcl=0.5, las=1, 
                                            yaxs="i", 
                                            mgp=c(3,0.5,0), 
                                            mar=c(5,5,2,2),
                                            cex.main=0.9))
  axis(2, at=c(0.000001, 0.00001, 0.0001, 0.001, 0.01, 0.1, 1, 10), 
       labels=c("0.000001", "0.00001", "0.0001", "0.001", "0.01", 
                "0.1", "1", "10"), cex.axis=0.7)
  
  # scatter plot of Simazine concentrations
  cenScatPlot(qwMoRivOmaha, pname="04035")
  
  # scatter plot with many additional plotting arguments
  par(las=1, tcl=0.5)
  cenScatPlot(qwMoRivOmaha, pname="04035", 
              site="06610000 Missouri River at Omaha, Nebr.",
              ylabel="Simazine concentration, in micrograms per liter", 
              legcex=0.7, qwcols=c("R", "P"),
              ylim=c(0,0.1), yaxs="i", cex.lab=0.9, cex.axis=0.9,
              xlim=c(as.Date("1996-01-01"), as.Date("2004-01-01")), 
              xaxs="i", xaxt="n")
  axdates<-c("1996-01-01", "1998-01-01", "2000-01-01", "2002-01-01", 
            "2004-01-01")
  axis(1, as.Date(axdates), labels=c("1996", "1998", "2000", "2002", 
                                     "2004"), cex.axis=0.9)
  
  # Prometon scatter plot
  cenScatPlot(qwMoRivOmaha, pname="04037", 
              site="06610000 Missouri River at Omaha, Nebr.",
              ylabel="Prometon concentration, in micrograms per liter", 
              legcex=0.7, qwcols=c("R", "P"),
              ylim=c(0,0.1), yaxs="i", cex.lab=0.9, cex.axis=0.9,
              xlim=c(as.Date("1996-01-01"), 
                     as.Date("2004-01-01")), xaxs="i", 
              xaxt="n")
  axdates<-c("1996-01-01", "1998-01-01", "2000-01-01", "2002-01-01", 
             "2004-01-01")
  axis(1, as.Date(axdates), labels=c("1996", "1998", "2000", "2002", 
                                     "2004"), cex.axis=0.9)

  # Cyanazine scatter plot
  cenScatPlot(qwMoRivOmaha, pname="04041", 
              site="06610000 Missouri River at Omaha, Nebr.",
              ylabel="Cyanazine concentration, in micrograms per liter",
              legcex=0.7, qwcols=c("R", "P"), 
              ylim=c(0.001,5), yaxs="i", cex.lab=0.9, cex.axis=0.9,
              xlim=c(as.Date("1996-01-01"), 
                     as.Date("2004-01-01")), xaxs="i", 
              xaxt="n", log="y")
  axdates<-c("1996-01-01", "1998-01-01", "2000-01-01", "2002-01-01", 
             "2004-01-01")
  axis(1, as.Date(axdates), labels=c("1996", "1998", "2000", "2002", 
                                     "2004"), cex.axis=0.9)

  # Metolachlor scatter plot
  cenScatPlot(qwMoRivOmaha, pname="39415", 
              site="06610000 Missouri River at Omaha, Nebr.",
              ylabel="Metolachlor concentration, in micrograms per liter",
              legcex=0.7, qwcols=c("R", "P"),
              ylim=c(0.001,5), yaxs="i", cex.lab=0.9, cex.axis=0.9,
              xlim=c(as.Date("1996-01-01"), 
                     as.Date("2004-01-01")), xaxs="i", 
              xaxt="n", log="y", legpos="bottomleft")
  axdates<-c("1996-01-01", "1998-01-01", "2000-01-01", "2002-01-01", 
             "2004-01-01")
  axis(1, as.Date(axdates), labels=c("1996", "1998", "2000", "2002", 
                                     "2004"), cex.axis=0.9)

  # Alachlor scatter plot
  cenScatPlot(qwMoRivOmaha, pname="46342", 
              site="06610000 Missouri River at Omaha, Nebr.",
              ylabel="Alachlor concentration, in micrograms per liter", 
              legcex=0.7, qwcols=c("R", "P"),
              ylim=c(0, 0.1), yaxs="i", cex.lab=0.9, cex.axis=0.9,
              xlim=c(as.Date("1996-01-01"), 
                     as.Date("2004-01-01")), xaxs="i", 
              xaxt="n")
  axdates<-c("1996-01-01", "1998-01-01", "2000-01-01", "2002-01-01", 
             "2004-01-01")
  axis(1, as.Date(axdates), labels=c("1996", "1998", "2000", "2002", 
                                     "2004"), cex.axis=0.9)
  
  # Metribuzin scatter plot
  cenScatPlot(qwMoRivOmaha, pname="82630", 
              site="06610000 Missouri River at Omaha, Nebr.",
              ylabel="Metribuzin concentration, in micrograms per liter",
              legcex=0.7, qwcols=c("R", "P"),
              ylim=c(0, 0.1), yaxs="i", cex.lab=0.9, cex.axis=0.9,
              xlim=c(as.Date("1996-01-01"), 
                     as.Date("2004-01-01")), xaxs="i", 
              xaxt="n")
  axdates<-c("1996-01-01", "1998-01-01", "2000-01-01", "2002-01-01", 
             "2004-01-01")
  axis(1, as.Date(axdates), labels=c("1996", "1998", "2000", "2002", 
                                     "2004"), cex.axis=0.9)

  # Trifluralin scatter plot
  cenScatPlot(qwMoRivOmaha, pname="82661", 
              site="06610000 Missouri River at Omaha, Nebr.",
              ylabel="Trifluralin concentration, in micrograms per liter",
              legcex=0.7, qwcols=c("R", "P"),
              ylim=c(0,0.03), yaxs="i", cex.lab=0.9, cex.axis=0.9,
              xlim=c(as.Date("1996-01-01"), 
                     as.Date("2004-01-01")), xaxs="i", 
              xaxt="n")
  axdates<-c("1996-01-01", "1998-01-01", "2000-01-01", "2002-01-01", 
             "2004-01-01")
  axis(1, as.Date(axdates), labels=c("1996", "1998", "2000", "2002", 
                                    "2004"), cex.axis=0.9)

  # EPTC scatter plot
  cenScatPlot(qwMoRivOmaha, pname="82668", 
              site="06610000 Missouri River at Omaha, Nebr.",
              ylabel="EPTC concentration, in micrograms per liter", 
              legcex=0.7, qwcols=c("R", "P"),
              ylim=c(0.001,1), yaxs="i", cex.lab=0.9, cex.axis=0.9,
              xlim=c(as.Date("1996-01-01"), 
                     as.Date("2004-01-01")), xaxs="i", 
              xaxt="n", log="y")
  axdates<-c("1996-01-01", "1998-01-01", "2000-01-01", "2002-01-01", 
             "2004-01-01")
  axis(1, as.Date(axdates), labels=c("1996", "1998", "2000", "2002", 
                                     "2004"), cex.axis=0.9)



