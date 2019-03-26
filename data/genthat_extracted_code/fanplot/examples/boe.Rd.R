library(fanplot)


### Name: boe
### Title: Parameters for MPC CPI Inflation Projections from Q1 2004 to Q4
###   2013.
### Aliases: boe
### Keywords: datasets

### ** Examples

##
##Q1 2013
##
#extract data for Q1 2013
y0 <- 2013
boe0<-subset(boe, time0==y0)
k <- nrow(boe0)

#guess work to set percentiles the boe are plotting
p <- seq(0.05, 0.95, 0.05)
p <- c(0.01, p, 0.99)

#estimate percentiles for future time period
pp <- matrix(NA, nrow = length(p), ncol = k)
for (i in 1:k)
  pp[, i] <- qsplitnorm(p, mode = boe0$mode[i], sd = boe0$uncertainty[i], skew = boe0$skew[i])
pp

#plot cpi
par(mar=rep(2,4))
plot(cpi, type = "l", xlim = floor(c(y0-5, y0+3)), ylim = c(-2, 7), las = 1, 
 col="tomato", lwd=2, xaxt = "n", yaxt = "n")

#backround
rect(y0-0.25, par("usr")[3] - 1, y0+3, par("usr")[4] + 1, border = "gray90", col = "gray90")

#fan
pal <- colorRampPalette(c("tomato", "gray90"))
fan(data=pp, probs=p, sim.data=FALSE, start=y0, frequency=4, 
 anchor=cpi[time(cpi)==y0-0.25], fan.col=pal, ln=NULL, rlab=FALSE)

#aesthetics for boe axis
axis(2, at = -2:7, las = 2, tcl = 0.5, labels = FALSE)
axis(4, at = -2:7, las = 2, tcl = 0.5)
axis(1, at = 2008:2016, tcl = 0.5)
axis(1, at = seq(2008, 2016, 0.25), labels = FALSE, tcl = 0.2)
abline(h = 2) #cpi target
abline(v = y0 + 1.75, lty = 2) #2 year line


##
##Q4 2013 (coarser fan)
##
#extract data for Q4 2013
y0 <- 2013.75
boe0<-subset(boe, time0==y0)
k <- nrow(boe0)

#guess work at which percentiles the boe are plotting
p <- seq(0.2, 0.8, 0.2)
p <- c(0.05, p, 0.95)
pp <- matrix(NA, nrow = length(p), ncol = k)
for (i in 1:k)
  pp[, i] <- qsplitnorm(p, mode = boe0$mode[i], sd = boe0$uncertainty[i], skew = boe0$skew[i])
pp

#define prediction intervals for labels
p.int<-p[4:6]-p[3:1]
p.int

#plot cpi
par(mar=rep(2,4))
plot(cpi, type = "l", xlim = c(y0-5, y0+3), ylim = c(-2, 7), las = 1, 
 col="tomato", lwd=2, xaxt = "n", yaxt = "n")

#backround
rect(y0-0.25, par("usr")[3] - 1, y0+3, par("usr")[4] + 1, border = "gray90", col = "gray90")

# add fan
pal <- colorRampPalette(c("tomato", "gray90"))
fan(data=pp, probs=p.int, sim.data=FALSE, start=y0, frequency=4,
 anchor=cpi[time(cpi)==y0-0.25], fan.col=pal, ln=NULL, rlab=pi, nfan=4, type="interval")

#aesthetics for boe axis
axis(2, at = -2:7, las = 2, tcl = 0.5, labels = FALSE)
axis(4, at = -2:7, las = 2, tcl = 0.5)
axis(1, at = 2008:2016, tcl = 0.5)
axis(1, at = seq(2008, 2016, 0.25), labels = FALSE, tcl = 0.2)
abline(h = 2) #cpi target
abline(v = y0 + 1.75, lty = 2) #2 year line



