library(metafor)


### Name: addpoly.default
### Title: Add Polygons to Forest Plots (Default Method)
### Aliases: addpoly.default
### Keywords: aplot

### ** Examples

### meta-analysis of the log risk ratios using a mixed-
### effects model with absolute latitude as a moderator
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, mods = ~ ablat,
           slab=paste(author, year, sep=", "), data=dat.bcg)

### forest plot of the observed risk ratios
forest(res, addfit=FALSE, atransf=exp, xlim=c(-8,5), ylim=c(-4.5,16), cex=.8,
       order=order(dat.bcg$ablat), ilab=dat.bcg$ablat, ilab.xpos=-2.8, ilab.pos=2)

### predicted average log risk ratios for 10, 30, and 50 degrees absolute latitude
x <- predict(res, newmods=c(10, 30, 50))

### add predicted average risk ratios to forest plot
addpoly(x$pred, sei=x$se, atransf=exp, col="white", rows=-2,
        mlab=c("- at 10 Degrees", "- at 30 Degrees", "- at 50 Degrees"), cex=.8)
abline(h=0)
text(-8,   -1, "Model-Based Estimates of RR:", pos=4, cex=.8)
text(-8,   15, "Author(s) and Year",   pos=4, cex=.8)
text(5,    15, "Risk Ratio [95% CI]", pos=2, cex=.8)
text(-3.3, 15, "Latitude", cex=.8)



