## ---- include=F----------------------------------------------------------
library(POPdemog)

## ---- include=F----------------------------------------------------------
cat("./ms 1 1 -r 25 250001 -t 2.5 -I 4 50 50 50 60 -n 1 10 -n 2 10 -n 3 10 -n 4 10 -em 0 1 4 0.32 -em 0 4 1 0.32 -em 0 3 4 0.08 -em 0 4 3 0.08 -em 5e-04 2 1 2000 -em 6e-04 2 1 0 -ej 7e-04 2 4 -en 0.02 4 2.4 -en 0.035 1 0.77 -en 0.04 3 0.77 -en 0.1997 4 0.0125 -en 0.1998 3 0.00149253731343284 -en 0.1999 1 0.005 -ej 0.2 3 1 -em 0.1996 1 4 0 -em 0.1995 4 1 0 -em 0.1994 3 4 0 -em 0.1993 4 3 0 -en 0.3499 1 0.00117647058823529 -ej 0.35 1 4 -en 1.7 4 1.25", file="sample.ms.cmd")

## ---- echo=T, message=F, warning=F, fig.width=5, fig.height=5,fig.cap="Figure 1: Basic plot"----
PlotMS(input.file="sample.ms.cmd", type="ms", N4=10000)

## ---- echo=T, message=FALSE, warning=F, fig.width=5, fig.height=5, fig.cap="Figure 2: Adding color and population names to the basic plot"----
PlotMS(input.file="sample.ms.cmd", type="ms", N4=10000, size.scale="log", 
       log.base =50, inpos=c(3,6,1,9), 
       col.pop=c("blue", "coral3", "gold3", "brown"), 
       pops=c("European", "African American", "Asian", "African"))

## ---- echo=T, message=FALSE, warning=F, fig.width=8, fig.height=3.3, fig.cap="Figure 3: Two types of demography plots"----
par(mfrow=c(1,2), las=1)
PlotMS(input.file="sample.ms.cmd", type="ms", N4=10000, 
       size.scale="log", log.base =50, inpos=c(3,6,1,9), 
       col.pop=c("blue", "coral3", "gold3", "brown"), 
       pops=c("European", "African American", "Asian", "African"), 
       time.scale="log10year", cex.lab=0.6, cex.axis=0.6, length.arrowtip=0.05, m.adjust=0.05)
title("Zoom in recent events", cex=0.8)
NRuler("topleft", Nsize=c(1e3, 1e5), Nlab=c("1e3","1e5"), N4=10000, size.scale="log",log.base=50, lwd=1, cex=0.6)
PlotMS(input.file="sample.ms.cmd", type="ms", N4=10000, 
       size.scale="topology", inpos=c(3,6,1,9), 
       col.pop=c("blue", "coral3", "gold3", "brown"), 
       pops=c("European", "African American", "Asian", "African"), 
       cex.lab=0.6, cex.axis=0.6, length.arrowtip=0.05, ylab="Time before present", m.adjust=0.05)
title("Topology plot", cex=0.8)

## ---- echo=T, message=FALSE, warning=F, fig.width=8, fig.height=9.5, fig.cap="Figure 4: Overview of all migrations"----
#output the demographic information from PlotMS
out<-PlotMS(input.file="sample.ms.cmd", type="ms", N4=10000, size.scale="log", 
	    log.base =50, col.arrow="black", time.scale="kyear",
	    col.pop=c("blue", "coral3", "gold3", "brown"), 
	    pops=c("European", "African American", "Asian", "African"), 
	    plot.out=F, demo.out=T,
	    cex.lab=0.5, cex.axis=0.6, length.arrowtip=0.05)
#plot the overview of all migrations
PlotMMig(demograph_out=out$demograph_out, mig_par=out$mig_par)

## ---- echo=T, message=FALSE, warning=F, fig.width=4, fig.height=6, fig.cap="Figure 5: Migration at the specified time"----
out<-PlotMS(input.file="sample.ms.cmd", type="ms", N4=10000, plot.out=F, demo.out=T)
PlotMig(time_pt=125, demograph_out=out$demograph_out, mig_par=out$mig_par, 
	size.scale="log", time.scale="year", log.base=20,
	col.pop=c("blue", "coral3", "gold3", "brown"), 
	xlim=c(-8, 8), ylim=c(-8, 12));
N<-NOut(time_pt=125, demograph_out=out$demograph_out, time.scale="year");
legend("topleft", pch=20, col=c("blue", "coral3", "gold3", "brown"), bty="n",
       legend=paste(c("European", "African American", "Asian", "African"), " : ", N/1000, "k", sep=""), )
title(paste("Time: 125 years ago"))

## ---- echo=T, message=FALSE, warning=F, fig.width=7, fig.height=5, fig.cap="Figure 6: Add migrations to a map"----
library(maps)
##initiate the world map
map('legacy_world', fill=T, col="gray45", bg="lightgray", lty=0)
axis(1);axis(2);
##the positions for the four populations
##European 50, 20
##Asian 36, 112
##African 7, 23
##African American 38, -100
inp.map.pos<-cbind(c(20, -100, 112, 23), c(50, 38, 36, 7))

out<-PlotMS(input.file="sample.ms.cmd", type="ms", N4=10000, plot.out=F, demo.out=T)
unlink("sample.ms.cmd")
times<-out$mig_par$time #time points for all events
times #output times points for all demographic events
for(i in times){
PlotMig(time_pt=i, demograph_out=out$demograph_out, mig_par=out$mig_par, 
        size.scale="topology", col.pop=c("blue", "coral3", "gold3", "brown"), 
        toposize.scale=50, add=T, map.pos=inp.map.pos, length.arrowtip=0.1, m.adjust=0.01, 
        col.arrow=c("blue", "coral3", "gold3", "brown"));
}

## ---- echo=T, message=FALSE, warning=F, fig.width=8, fig.height=4.5, fig.cap="Figure 7: Modified Tennessen's model"----
cat("macs 2025 15000000 -i 10 -r 3.0e-04 -t 0.00069 -T -I 4 10 1006 1008 1 0
-n 4 0.205 -n 1 58.00274 -n 2 70.041 -n 3 187.55 -eg 0.9e-10 1 482.46
-eg 1.0e-10 2 570.18 -eg 1.1e-10 3 720.23 -em 1.2e-10 1 2 0.731
-em 1.3e-10 2 1 0.731 -em 1.4e-10 3 1 0.2281 -em 1.5e-10 1 3 0.2281
-em 1.6e-10 2 3 0.9094 -em 1.7e-10 3 2 0.9094 -eg 0.007 1 0
-en 0.007001 1 1.98 -eg 0.007002 2 89.7668 -eg 0.007003 3 113.3896
-eG 0.031456 0 -en 0.031457 2 0.1412 -en 0.031458 3 0.07579
-eM 0.031459 0 -ej 0.03146 3 2 -en 0.0314601 2 0.2546
-em 0.0314602 2 1 4.386 -em 0.0314603 1 2 4.386 -eM 0.0697669 0
-ej 0.069767 2 1 -en 0.0697671 1 1.98 -en 0.2025 1 1 -ej 0.9575923 4 1
-em 0.06765 2 4 32 -em 0.06840 2 4 0", file="model-Tennessen.cmd")
#plot the demographic graph
par(mfrow=c(1,2), las=1)
PlotMS(input.file="model-Tennessen.cmd", type="macs", N4=30000, 
       size.scale="log", log.base=50, inpos=c(1,4,7,9), time.scale="log10year", 
       col.pop=c("brown", "blue", "gold3", "forestgreen"), 
       pops=c("AFR", "EUR", "ASIA", "ARC"), cex.lab=1, cex.axis=1, xlab="", length.arrowtip=0.1)
##add population size ruler to the plot to reflect the real population sizes
NRuler("topleft", Nsize=c(1e5,1e6,1e7), Nlab=c("1e5","1e6", "1e7"), N4=30000, 
       size.scale="log",log.base=50, lwd=1, cex=0.6)
title("Demographic history")
PlotMS(input.file="model-Tennessen.cmd", type="macs", N4=30000,
       time.scale="log10year", plot.out=F, demo.out=T)->out;
#log10(1000)=3
PlotMig(time_pt=1000, time.scale="year",
        demograph_out=out$demograph_out, mig_par=out$mig_par, 
        col.pop=c("brown", "blue", "gold3", "forestgreen"), 
	size.scale="linear", linear.scale=0.000003,
        xlim=c(0,20), ylim=c(0,30), length.arrowtip=0.08)
##annotate the real population sizes
N<-NOut(time_pt=1000, time.scale="year", demograph_out=out$demograph_out)
legend("topleft", 
       legend=paste(c("AFR", "EUR", "ASIA", "ARC"), "size:", N), 
       col=c("brown", "blue", "gold3", "forestgreen"), pch=20, bty="n")
title("Migrations 1000 years ago");

## ---- echo=T, message=FALSE, warning=F, fig.width=7, fig.height=7, fig.cap="Figure 7.1: Three migration plots from Modified Tennessen's model"----
par(mfrow=c(2,2))
PlotMig(time_pt=3, demograph_out=out$demograph_out, mig_par=out$mig_par, 
	col.pop=c("brown", "blue", "gold3", "forestgreen"), 
	size.scale="log", log.base=100, length.arrowtip=0.1, 
	xlim=c(0,15), ylim=c(0,15))
title("size.scale=\"log\", log.base=100")
PlotMig(time_pt=3, demograph_out=out$demograph_out, mig_par=out$mig_par,
        col.pop=c("brown", "blue", "gold3", "forestgreen"),
        size.scale="linear", linear.scale=0.000003, length.arrowtip=0.1,
        xlim=c(0,15), ylim=c(0,15))
title("size.scale=\"linear\", linear.base=0.000003")
PlotMig(time_pt=3, demograph_out=out$demograph_out, mig_par=out$mig_par, 
	col.pop=c("brown", "blue", "gold3", "forestgreen"), 
	size.scale="topology", toposize.scale=0.5, length.arrowtip=0.1);
title("size.scale=\"topology\", toposize.scale=1")
PlotMig(time_pt=3, demograph_out=out$demograph_out, mig_par=out$mig_par, 
	col.pop=c("brown", "blue", "gold3", "forestgreen"), 
	size.scale="topology", toposize.scale=2, length.arrowtip=0.1);
title("size.scale=\"topology\", toposize.scale=2");unlink("model-Tennessen.cmd")

## ---- echo=T, message=FALSE, warning=F, fig.width=5, fig.height=4.5, fig.cap="Figure 8: Archaic introgrssion model"----
cat("./ms 44 1 -r 20000 50000000 -t 30000 -I 6 20 20 1 1 1 1 -en 0 1 1
-en 0 2 1 -en 0 3 1e-10 -en 0 4 1e-10 -en 0 5 1e-10 -en 0 6 1e-10
-es 0.0125 2 0.97 -en 0.02500025 7 0.25 -en 0.02500025 2 1 -ej 0.05 4 3
-ej 0.05 6 5 -en 0.05000025 3 0.25 -en 0.05000025 5 0.25 -ej 0.0500025 5 3
-en 0.050005 3 0.25 -ej 0.075 2 1 -en 0.0750025 1 1 -ej 0.1 7 3
-en 0.1000025 3 0.25 -ej 0.3 3 1 -en 0.3000025 1 1", file="test.1.ms.cmd")
PlotMS(input.file="test.1.ms.cmd", type="ms", N4=10000, 
time.scale="kyear", length.arrowtip=0.1, inpos=c(1,2,5,4.5,5.5,6,3), 
col.pop=c("brown", "blue", "forestgreen", rainbow(10)[6:9]));unlink("test.1.ms.cmd")

## ---- echo=T, message=FALSE, warning=F, fig.width=6, fig.height=4.5, fig.cap="Figure 9: Migration"----
cat("./ms 15 100 -t 3.0 -I 6 0 7 0 0 8 0 -m 1 2 2.5 -m 2 1 2.5 -m 2 3 2.5
-m 3 2 2.5 -m 4 5 2.5 -m 5 4 2.5 -m 5 6 2.5 -m 6 5 2.5 -em 2.0 3 4 2.5
-em 2.0 4 3 2.5", file="test.2.ms.cmd")
PlotMS(input.file="test.2.ms.cmd", type="ms", N4=10000, col.pop="gray",
col.arrow="black", length.arrowtip=0.1, lwd.arrow=2);unlink("test.2.ms.cmd")

## ---- echo=T, message=FALSE, warning=F, fig.width=5, fig.height=4.5, fig.cap="Figure 10: Ryan2009"----
cat("./ms 1 1 -t 1.0 -I 3 10 10 10 -n 1 1.682020 -n 2 3.736830 -n 3 7.292050
-eg 0 2 116.010723 -eg 0 3 160.246047
-ma 0 0.881098 0.561966 0.881098 0 2.797460 0.561966 2.797460 0
-ej 0.028985 3 2 -en 0.028985 2 0.287184
-ema 0.028985 3 0 7.293140 0 7.293140 0 0 0 0 0 -ej 0.197963 2 1
-en 0.303501 1 1", file="Ryan2009.cmd")
PlotMS(input.file="Ryan2009.cmd", type="ms", N4=35000, size.scale="log", 
log.base=2, time.scale="kyear",
pops=c("AFR", "EUR", "ESA"), col.pop=c("brown", "blue", "gold3"));unlink("Ryan2009.cmd")


## ---- echo=T, message=FALSE, warning=F, fig.width=6, fig.height=4.5, fig.cap="Figure 11: zigzag model"----
cat("ms 4 1 -t 7156.0000000 -r 2000.0000 10000000 -eN 0 5 -eG 0.000582262 1318.18
-eG 0.00232905 -329.546 -eG 0.00931619 82.3865 -eG 0.0372648 -20.5966
-eG 0.149059 5.14916 -eN 0.596236 0.5 -T", file="zigzag.cmd")
par(mfrow=c(1,2), las=1)
PlotMS(input.file="zigzag.cmd", type="ms", N4=10000)
#change the time unit
PlotMS(input.file="zigzag.cmd", type="ms", N4=10000, time.scale="log10year");unlink("zigzag.cmd")

## ---- echo=T, message=FALSE, warning=F, fig.width=8, fig.height=4.5------
cat("
--structure 3 1 1 1
--population-size 1 0.3075
--population-size 2 0.7431335886597129
--population-growth-rate-change 0 2 160.0
--population-size 3 1.352258276948663
--population-growth-rate-change 0 3 220.0
--migration-matrix x 1.2 0.76 1.2 x 3.8400000000000003 0.76 3.8400000000000003 x
--population-split 0.0212 3 2
--population-size-change 0.0212 2 0.0525
--population-growth-rate-change 0.0212 2 0
--migration-matrix-change 0.0212 3 x 10.0 x 10.0 x x x x x
--population-split 0.14 2 1
--population-size-change 0.22 1 0.1825",
file="msprime.demo.cmd")

## ---- echo=T, message=FALSE, warning=F, fig.width=8, fig.height=4.5, fig.cap="Figure 12: Plot from msprime's input"----
#plot the demographic graph
par(mfrow=c(1,2),las=1)
PlotMS(input.file="msprime.demo.cmd", type="msprime", N4=4*10000, 
       size.scale="log", log.base=1.5, inpos=c(1,4,7), time.scale="log10year", 
       col.pop=c("brown", "blue", "gold3"), pops=c("AFR", "EUR", "ASIA"), 
       cex.lab=1, cex.axis=1, xlab="", length.arrowtip=0.1)
title("Demographic history")
NRuler("topleft", Nsize=c(1e4,1e5), Nlab=c("1e4", "1e5"), N4=40000, 
       size.scale="log",log.base=1.5, lwd=1, cex=0.6)
PlotMS(input.file="msprime.demo.cmd", type="msprime", N4=4*10000,
       time.scale="log10year", plot.out=F, demo.out=T )->out;
PlotMig(time_pt=100, demograph_out=out$demograph_out, time.scale="year",
	mig_par=out$mig_par, col.pop=c("brown", "blue", "gold3"), 
	size.scale="topology");
legend("topleft", legend=c("AFR", "EUR", "ASIA"), col=c("brown", "blue", "gold3"), pch=20, bty="n")
title("Migrations 100 years ago");unlink("msprime.demo.cmd")

## ---- echo=T, message=FALSE, warning=F, fig.width=8, fig.height=3.3, fig.cap="Figure 13: Two types of the demography plots (repeat of Figure 3 with SCRM input)"----
cat("scrm 1 1 -r 25 250001 -t 2.5 -I 4 50 50 50 60 -n 1 10 -n 2 10
    -n 3 10 -n 4 10 -em 0 1 4 0.32 -em 0 4 1 0.32 -em 0 3 4 0.08 
    -em 0 4 3 0.08 -eps 5e-04 2 1 0.8 -ej 7e-04 2 4 
    -en 0.02 4 2.4 -en 0.035 1 0.77 -en 0.04 3 0.77 -en 0.1997 4 0.0125 
    -en 0.1998 3 0.00149253731343284 -en 0.1999 1 0.005 -ej 0.2 3 1 
    -em 0.1996 1 4 0 -em 0.1995 4 1 0 -em 0.1994 3 4 0 -em 0.1993 4 3 0 
    -en 0.3499 1 0.00117647058823529 -ej 0.35 1 4 -en 1.7 4 1.25", file="scrm.demo.cmd")
par(mfrow=c(1,2), las=1)
PlotMS(input.file="scrm.demo.cmd", type="scrm", N4=10000,
       size.scale="log", log.base =50, inpos=c(3,6,1,9),
       col.pop=c("blue", "coral3", "gold3", "brown"),
       pops=c("European", "African American", "Asian", "African"),
       time.scale="log10year", cex.lab=0.6, cex.axis=0.6, length.arrowtip=0.05, m.adjust=0.05)
title("Zoom in recent events", cex=0.8)
PlotMS(input.file="scrm.demo.cmd", type="scrm", N4=10000,
       size.scale="topology", inpos=c(3,6,1,9),
       col.pop=c("blue", "coral3", "gold3", "brown"),
       pops=c("European", "African American", "Asian", "African"),
       cex.lab=0.6, cex.axis=0.6, length.arrowtip=0.05, ylab="Time before present", m.adjust=0.05)
title("Topology plot", cex=0.8);unlink("scrm.demo.cmd")

