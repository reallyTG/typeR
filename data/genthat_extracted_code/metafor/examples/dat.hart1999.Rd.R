library(metafor)


### Name: dat.hart1999
### Title: Studies on the Effectiveness of Warfarin for Preventing Strokes
### Aliases: dat.hart1999
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.hart1999))

### calculate log incidence rate ratios and corresponding sampling variances
dat <- escalc(measure="IRR", x1i=x1i, x2i=x2i, t1i=t1i, t2i=t2i, data=dat)
dat

### meta-analysis of log incidence rate ratios using a random-effects model
res <- rma(yi, vi, data=dat)
res

### average incidence rate ratio with 95% CI
predict(res, transf=exp)

### forest plot with extra annotations
par(mar=c(5,4,1,2))
forest(res, xlim=c(-11, 5), at=log(c(.05, .25, 1, 4)), atransf=exp,
       slab=paste0(dat$study, " (", dat$year, ")"),
       ilab=cbind(paste(dat$x1i, "/", dat$t1i, sep=" "),
       paste(dat$x2i, "/", dat$t2i, sep=" ")),
       ilab.xpos=c(-6.5,-4), cex=.85)
op <- par(cex=.85, font=2)
text(-11, 7.5, "Study (Year)", pos=4)
text(  5, 7.5, "IRR [95% CI]", pos=2)
text(c(-6.5,-4), 8.0, c("Warfarin", "Control"))
text(c(-6.5,-4), 7.5, c("Strokes / PT", "Strokes / PT"))
segments(x0=-7.75, y0=7.75, x1=-2.75, y1=7.75)
par(op)

### meta-analysis of incidence rate differences using a random-effects model
res <- rma(measure="IRD", x1i=x1i, x2i=x2i, t1i=t1i, t2i=t2i, data=dat)
res



