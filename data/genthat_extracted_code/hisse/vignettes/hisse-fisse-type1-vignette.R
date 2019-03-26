## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=12, fig.height=4)

## ------------------------------------------------------------------------
a <- 1e-100
a == 2 * a

b <- 1e-1000
b == 2 * b

## ---- eval=TRUE, echo=FALSE, fig.cap = "Reanalysis of the Rabosky and Goldberg (2017) using a bounded subplex optimization routine. Overall, the results from the updated optimization routine closely follow those presented in the original study."----
xx <- read.table("May2017_CID4_added_setsummaries.csv", stringsAsFactors=F, header=T, sep=",")

xxy <- xx[xx$True.SDD == "yes", ]
xxn <- xx[xx$True.SDD == "no", ]

#quartz.options(height = 4, width=12)
#plot.new()
par(oma=c(1,2,1,1))
mm <- matrix(c(1, 2,2), nrow=2, ncol=3, byrow=T)
layout(mm)

wid <- 0.25

plot.new()
par(mar=c(5,5,1,1))
plot.window(xlim=c(0, 16), ylim=c(0,1))

for (i in 1:nrow(xxy)){
    lines(c(i,i, i), y=c(xxy$fullset_sdd.frac[i], xxy$cid_bisse.frac[i], xxy$fisse.sig[i]), lwd=0.9, col="gray60")
    points(i, xxy$fullset_sdd.frac[i], pch=22, col="blue", bg="blue", cex=1.9)
    points(i , xxy$cid_bisse.frac[i], pch=24, col="blue", bg="white", cex=1.6)
    points(i , xxy$fisse.sig[i], pch=21, bg="red", cex=1.6)
    
    if (is.na(xxy$original_index_doubleblind[i])){
        mtext("*", side=1, at=i, line=1.1, cex=1.5)
    }
    
}

points(0.5, 1, pch=24, bg="white", col="blue", cex=1.6)
points(0.5, 0.9, pch=22, bg="blue", cex=1.8)
points(0.5, 0.8, pch=21, bg="red", cex=1.6)

text(0.7, 1.0, labels="BiSSE", cex=1.25, pos=4, font=3)
text(0.7, 0.9, labels=expression("BiSSE+HiSSE"), cex=1.25, pos=4, font=3)
#text(0.7, 0.8, labels=expression("BiSSE+HiSSE"^Orig.), cex=1.25, pos=4, font=3)
text(0.7, 0.8, labels="FiSSE", cex=1.25, pos=4, font=3)

axis(1, at=c(-2, seq(1, 15, by=1), 16), labels=NA)
axis(1, at=seq(1, 15, by=2), tick=F, cex.axis=1.2, padj=0.5)
mtext("Simulation scenario: true SDD", side=1, line=3.25, cex=1.2)
axis(2, at=seq(-0.1, 1.0, by=0.1), label=NA)
axis(2, at=seq(0, 1, by=0.2), las=1, tick=F, cex.axis=1.2)
mtext(side=2, text="Proportion significant", line= 3.7, cex=1.2)
mtext(side=2, text="A", line= 3.7, cex=1.4, las=1, at=1.05)

plot.new()
par(mar=c(5,5,1,1))
plot.window(xlim=c(0, 34.5), ylim=c(0,1))
polygon(x=c(-2,-2, 35,35), y=c(0,0.05, 0.05,0), border=F, col="gray80")

for (i in 1:nrow(xxn)){
    lines(c(i,i, i), y=c(xxn$fullset_sdd.frac[i], xxn$cid_bisse.frac[i], xxn$fisse.sig[i]), lwd=0.9, col="gray60")
    points(i, xxn$fullset_sdd.frac[i], pch=22, col="blue", bg="blue", cex=1.9)
    points(i , xxn$cid_bisse.frac[i], pch=24, col="blue", bg="white", cex=1.6)
    points(i , xxn$fisse.sig[i], pch=21, bg="red", cex=1.6)
    
    if (is.na(xxn$original_index_doubleblind[i])){
        mtext("*", side=1, at=i, line=1.1, cex=1.5)
    }
    
}
axis(1, at=c(-2, seq(1, 34, by=1), 36), labels=NA)
axis(1, at=seq(1, 33, by=2), labels= seq(17, 49, by=2), tick=F, cex.axis=1.2, padj=0.5)
mtext("Simulation scenario: no SDD", side=1, line=3.25, cex=1.2)
axis(2, at=seq(-0.1, 1.0, by=0.1), label=NA)
axis(2, at=seq(0, 1, by=0.2), las=1, tick=F, cex.axis=1.2)
#mtext(side=2, text="Type I error rate", line= 3.5, cex=1.2)
mtext(side=2, text="Proportion significant", line= 3.7, cex=1.2)
mtext(side=2, text="B", line= 3.7, cex=1.4, las=1, at=1.05)


## ---- eval=TRUE, echo=FALSE, fig.cap = "Reanalysis of the Rabosky and Goldberg (2017) when our 4-state character independent model, CID-4, is included in the model set (dark blue boxes). When compared against the fit of BiSSE, CID-2, and HiSSE, the (A) power to detect the trait-dependent diversification remains unchanged. For the trait-independent scenarios (B), there is almost always a reduction in the 'false positive' rate (as indicated by the difference in the position of the light blue and dark blue boxes), and in many cases the reduction is substantial."----
xx <- read.table("May2017_CID4_added_setsummaries.csv", stringsAsFactors=F, header=T, sep=",")

xxy <- xx[xx$True.SDD == "yes", ]
xxn <- xx[xx$True.SDD == "no", ]

#quartz.options(height = 4, width=12)
#plot.new()
par(oma=c(1,2,1,1))
mm <- matrix(c(1, 2,2), nrow=2, ncol=3, byrow=T)
layout(mm)

wid <- 0.25

plot.new()
par(mar=c(5,5,1,1))
plot.window(xlim=c(0, 16), ylim=c(0,1))

for (i in 1:nrow(xxy)){
    lines(c(i,i, i), y=c(xxy$fullset_sdd.frac.1[i], xxy$cid_bisse.frac.1[i], xxy$fisse.sig[i]), lwd=0.9, col="gray60")
    points(i, xxy$fullset_sdd.frac.1[i], pch=22, col="blue", bg="blue", cex=1.9)
    points(i, xxy$fullset_sdd.frac[i], pch=22, col=rgb(0,0,1,.2), bg=rgb(0,0,1,.2), cex=1.9)
    points(i , xxy$fisse.sig[i], pch=21, bg="red", cex=1.6)
    
    if (is.na(xxy$original_index_doubleblind[i])){
        mtext("*", side=1, at=i, line=1.1, cex=1.5)
    }
    
}

points(0.5, 1, pch=22, bg=rgb(0,0,1,.2), col=rgb(0,0,1,.2), cex=1.8)
points(0.5, 0.9, pch=22, bg="blue", cex=1.8)
points(0.5, 0.8, pch=21, bg="red", cex=1.6)

text(0.7, 1, labels=expression("BiSSE+HiSSE"^Orig.), cex=1.25, pos=4, font=3)
text(0.7, 0.9, labels=expression("BiSSE+HiSSE"^wCID4), cex=1.25, pos=4, font=3)

text(0.7, 0.8, labels="FiSSE", cex=1.25, pos=4, font=3)

axis(1, at=c(-2, seq(1, 15, by=1), 16), labels=NA)
axis(1, at=seq(1, 15, by=2), tick=F, cex.axis=1.2, padj=0.5)
mtext("Simulation scenario: true SDD", side=1, line=3.25, cex=1.2)
axis(2, at=seq(-0.1, 1.0, by=0.1), label=NA)
axis(2, at=seq(0, 1, by=0.2), las=1, tick=F, cex.axis=1.2)
mtext(side=2, text="Proportion significant", line= 3.7, cex=1.2)
mtext(side=2, text="A", line= 3.7, cex=1.4, las=1, at=1.05)

plot.new()
par(mar=c(5,5,1,1))
plot.window(xlim=c(0, 34.5), ylim=c(0,1))
polygon(x=c(-2,-2, 35,35), y=c(0,0.05, 0.05,0), border=F, col="gray80")

for (i in 1:nrow(xxn)){
    lines(c(i,i, i), y=c(xxn$fullset_sdd.frac.1[i], xxn$fullset_sdd.frac.1[i], xxn$fisse.sig[i]), lwd=0.9, col="gray60")
    points(i, xxn$fullset_sdd.frac.1[i], pch=22, col="blue", bg="blue", cex=1.9)
    points(i, xxn$fullset_sdd.frac[i], pch=22, col=rgb(0,0,1,.2), bg=rgb(0,0,1,.2), cex=1.9)
    points(i , xxn$fisse.sig[i], pch=21, bg="red", cex=1.6)
    
    if (is.na(xxn$original_index_doubleblind[i])){
        mtext("*", side=1, at=i, line=1.1, cex=1.5)
    }
    
}

axis(1, at=c(-2, seq(1, 34, by=1), 36), labels=NA)
axis(1, at=seq(1, 33, by=2), labels= seq(17, 49, by=2), tick=F, cex.axis=1.2, padj=0.5)
mtext("Simulation scenario: no SDD", side=1, line=3.25, cex=1.2)
axis(2, at=seq(-0.1, 1.0, by=0.1), label=NA)
axis(2, at=seq(0, 1, by=0.2), las=1, tick=F, cex.axis=1.2)
#mtext(side=2, text="Type I error rate", line= 3.5, cex=1.2)
mtext(side=2, text="Proportion significant", line= 3.7, cex=1.2)
mtext(side=2, text="B", line= 3.7, cex=1.4, las=1, at=1.05)

## ---- eval=TRUE, echo=FALSE, fig.cap = "Relationship between parsimony score of the simulated character and the proportion of data set that returned spurious support for trait-dependent diversification. (A) Across all trait-independent scenarios, there was no trend, but when examining only the scenarios that modified empirical trees (B), there was a postive trend between parsimony score and the 'false positive' rate. (C) We also found no relationship between Colless' Index (Ic), which we standardized by the Ic of completely pectinate tree with the same number of tips, and the 'false positive' rate, and the empirical trees (orange boxes) do not stand out as being overly balanced or imbalanced relative to the simulated trees (blue boxes)."----
par(oma=c(1,2,1,1))
mm <- matrix(c(1,2,3), nrow=2, ncol=3, byrow=T)
layout(mm)

xx.red <- xx[xx$True.SDD=="no",]
plot(xx.red[, "mean.parscore"], xx.red[, "fullset_sdd.frac.1"], axes=FALSE, xlab="", ylab="", xlim=c(0, 160), ylim=c(0,1), pch=22, bg="blue", cex=1.5)
par(tck=.01)
axis(2, at = seq(0,1, by = .2), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
axis(1, at = seq(0,160, by = 40), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
mtext("Mean parsimony score", side=1, line=3.25, cex=1.2)
mtext(side=2, text="Proportion significant", line= 3.7, cex=1.2)
mtext("All non-SDD data sets",side=3, line=0, adj=0)
mtext(side=2, text="A", line=3.7, cex=1.4, las=1, at=1.05)

plot(xx.red[xx.red$Tree.Note1=="empirical", "mean.parscore"], xx.red[xx.red$Tree.Note1=="empirical", "fullset_sdd.frac.1"], axes=FALSE, xlab="", ylab="", xlim=c(0, 60), ylim=c(0,1), pch=22, bg="blue", cex=1.5)
par(tck=.01)
axis(2, at = seq(0,1, by = .2), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
axis(1, at = seq(0,60, by = 10), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
mtext("Mean parsimony score", side=1, line=3.25, cex=1.2)
#mtext(side=2, text="Proportion significant", line= 3.7, cex=1.2)
mtext("Empirical non-SDD data sets", side=3, line=0, adj=0)
mtext(side=2, text="B", line=3.7, cex=1.4, las=1, at=1.05)

plot(xx.red[, "mean.tree.shape"], xx.red[, "fullset_sdd.frac.1"], axes=FALSE, xlab="", ylab="", xlim=c(0, .08), ylim=c(0,1), col=0, cex=1.5)
points(xx.red[xx.red$Tree.Note1=="simulated", "mean.tree.shape"], xx.red[xx.red$Tree.Note1=="simulated", "fullset_sdd.frac.1"],  pch=22, bg="blue", cex=1.5)
points(xx.red[xx.red$Tree.Note1=="empirical", "mean.tree.shape"], xx.red[xx.red$Tree.Note1=="empirical", "fullset_sdd.frac.1"],  pch=22, bg="darkorange", cex=1.5)
points(0, 0.95, pch=22, bg="blue", col=rgb(0,0,1,.2), cex=1.8)
points(0, 0.85, pch=22, bg="darkorange", cex=1.8)
text(0, 0.95, labels="Simulated trees", cex=1.25, pos=4, font=3)
text(0, 0.85, labels="Empirical trees", cex=1.25, pos=4, font=3)
par(tck=.01)
axis(2, at = seq(0,1, by = .2), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
axis(1, at = seq(0,.08, by = .02), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
mtext("Mean standardized Ic", side=1, line=3.25, cex=1.2)
#mtext(side=2, text="Proportion significant", line= 3.7, cex=1.2)
mtext("All non-SDD data sets",side=3, line=0, adj=0)
mtext(side=2, text="C", line=3.7, cex=1.4, las=1, at=1.05)

## ---- eval=TRUE, echo=FALSE, fig.height=4.5, fig.width=6.5, fig.cap = "Model-averaged parameter estimates of turnover and speciation from two scenarios, a true SSD scenario (A,B) where our HiSSE model set showed high 'false negative' rates (i.e., failed to reject a trait-independent scenario), and a non-SSD scenario (C,D) which exhibited a 54% false-positive rate. In the case of the non-SSD scenario, it clearly shows that despite the poor performance of from a model rejection perspective, examining the the model parameters would indicate that on average, there are no differences in diversification rates among observed states. The dashed orange line represents the expected ratio to be compared against a ratio of difference in diversification rates between state 0 and 1 denoted by the dotted black line."----
par(mfcol=c(2,2), mar=c(4,4,0.5,0.5), oma=c(1,2,1,1))

load("setCAQTipRatios.Rsave")
hist.obj <- hist(final.res[,1], breaks=35, plot=FALSE)
hist.obj$counts <- hist.obj$counts/sum(hist.obj$counts)
plot(hist.obj, axes=FALSE, xlab="", ylab="", main="", xlim=c(0.0, 2), ylim=c(0,.3), col="blue")
par(tck=.01)
axis(2, at = seq(0,.3, by = .05), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
axis(1, at = seq(0, 2, by = .25), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
abline(v=1, lty=3, lwd=2)
abline(v=0.5, lty=2, lwd=1.5, col="darkorange")
mtext("Scen. 6: True SSD, 30% 'False negative' rate",side=3, line=0, adj=0, cex=.7)
title(ylab="Frequency", line=2.5)
#title(xlab=expression(Estimated~alpha), line=2)
legend(1,0.30, c("Expected ratio"), lty=2, lwd=.75,col="darkorange", bty="n", cex=.75) 
mtext("A",side=2, las=1, line=2.5, at=0.35)

load("setMEVTipRatios.Rsave")
hist.obj <- hist(final.res[,1], breaks=20, plot=FALSE)
hist.obj$counts <- hist.obj$counts/sum(hist.obj$counts)
plot(hist.obj, axes=FALSE, xlab="", ylab="", main="", xlim=c(0.0, 2), ylim=c(0,.3), col="blue")
par(tck=.01)
axis(2, at = seq(0,.3, by = .05), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
axis(1, at = seq(0, 2, by = .25), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
abline(v=1, lty=3, lwd=2)
abline(v=1, lty=2, lwd=1.5, col="darkorange")
title(ylab="Frequency", line=2.5)
title(xlab="Tip ratio 0:1 turnover rate", line=2)
mtext("Scen. 42: Non-SSD, 54% 'False positive' rate",side=3, line=0, adj=0,cex=.7)
mtext("C",side=2, las=1, line=2.5, at=0.35)

load("setCAQTipRatios.Rsave")
hist.obj <- hist(final.res[,3], breaks=20, plot=FALSE)
hist.obj$counts <- hist.obj$counts/sum(hist.obj$counts)
plot(hist.obj, axes=FALSE, xlab="", ylab="", main="", xlim=c(0.0, 2), ylim=c(0,.3), col="blue")
par(tck=.01)
axis(2, at = seq(0,.3, by = .05), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
axis(1, at = seq(0, 2, by = .25), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
abline(v=1, lty=3, lwd=2)
abline(v=0.5, lty=2, lwd=1.5, col="darkorange")
mtext("B",side=2, las=1, line=2.5, at=0.35)

load("setMEVTipRatios.Rsave")
hist.obj <- hist(final.res[,3], breaks=20, plot=FALSE)
hist.obj$counts <- hist.obj$counts/sum(hist.obj$counts)
plot(hist.obj, axes=FALSE, xlab="", ylab="", main="", xlim=c(0.0, 2), ylim=c(0,.3), col="blue")
par(tck=.01)
axis(2, at = seq(0,0.3, by = .05), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
axis(1, at = seq(0, 2, by = .25), las =1, lwd=1, labels=TRUE, mgp=c(.75,.5,0))
abline(v=1, lty=3, lwd=2)
abline(v=1, lty=2, lwd=1.5, col="darkorange")
title(xlab="Tip ratio 0:1 speciation rate", line=2)
mtext("D",side=2, las=1, line=2.5, at=0.35)

