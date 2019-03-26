## ---- echo=TRUE----------------------------------------------------------
library(kitagawa)

## ---- echo=TRUE----------------------------------------------------------
library(psd)
data(Tohoku)
toh_orig <- with(subset(Tohoku, epoch=='seismic'), {
  cbind(
    scale(1e3*areal, scale=FALSE), # scale strain to nanostrain, remove mean
    scale(1e2*pressure.pore, scale=FALSE) # scale hPa to Pa, remove mean
  )
})
colnames(toh_orig) <- c('input','output')
toh.dat <- window(ts(toh_orig), 100, 2400)

## ---- echo=FALSE, fig.show='hold', fig.width=7., fig.height=4.5----------
library(RColorBrewer)
Set1 <- brewer.pal(8, 'Set1')
par(mar=c(3,3,0.2,0.2))
plot(toh.dat, yax.flip = TRUE, main="Strain and Pressure: 2011 M9 Tohoku")

## ---- echo=FALSE, fig.show='hold', fig.width=4.5, fig.height=4.5---------
IO <- as.matrix(toh.dat)
plot(IO[,1], IO[,2], 
     asp=1, col=NA, 
     main='Pressure-strain correlation',
     xlab="Input (strain)", 
     ylab="Output (pore pressure)")
grid()
points(IO[,1], IO[,2], pch=3)

## ---- echo=TRUE----------------------------------------------------------
library(sapa)
k <- 2*130
toh.cs <- sapa::SDF(toh.dat, method='multitaper', n.taper=k, sampling.interval=1)
print(toh.cs)

## ---- echo=FALSE, fig.show='hold', fig.width=7., fig.height=5.5----------
plot(toh.cs)

## ---- echo=FALSE, fig.show='hold', fig.width=7., fig.height=2.5----------
#based on $k$ sine tapers:
par(mar=c(3,2,1,0.2))
hantaps <- t(unclass(attr(toh.cs,'taper')))
#matplot(hantaps, type='l', lty=1, xlab='', ylab='time, seconds')

## ---- echo=TRUE----------------------------------------------------------
f <- as.vector(attr(toh.cs, 'frequency'))
lf <- log10(f)
p <- 1/f
lp <- log10(p)
S <- as.matrix(toh.cs)
colnames(S) <- attr(toh.cs, 'labels')
S11 <- S[,'S11']
S12 <- S[,'S12']
S22 <- S[,'S22']
Coh <- abs(Mod(S12)^2 / (S11 * S22))
G <- abs(sqrt(Coh * S22 / S11))
Phi <- atan2(x = Re(S12), y = Im(S12))
Phi2 <- Arg(S12)
all.equal(Phi, Phi2)

## ------------------------------------------------------------------------
gam <- seq(0.001, 1, by=0.001)
gamrat <- 2 * gam / (1 - gam)
Pgam <- pf(k*gamrat, 2, 4*k)

## ---- echo=FALSE, fig.show='hold', fig.width=5.5, fig.height=4.5---------
k2 <- 100
Pgam2 <- pf(k2*gamrat, 2, 4*k2)
k3 <- 10
Pgam3 <- pf(k3*gamrat, 2, 4*k3)
x.g <- ((1 - gam)*gamrat/2)
plot(x.g, Pgam, type='l', 
     main=expression(F(2*","~4*k)), 
     xlab=expression(gamma), 
     ylab=expression(p(gamma,k)), log='x')
lines(x.g, Pgam2, lty=5)
lines(x.g, Pgam3, lty=2)
legend('bottomright', parse(text=c(sprintf("k==%s",c(k,k2,k3)))), lty=c(1,5,2))
coh.99 <- max(gam[Pgam <= 0.995]) # confidence level

## ------------------------------------------------------------------------
G.err <- sqrt((1 - Coh) / k)

## ---- echo=TRUE----------------------------------------------------------
csd <- data.frame(f, p, lf, lp, Coh, G, G.err, Phi = Phi * 180 / pi)
csd.f <- subset(csd, p <= 100)
is.sig <- csd.f$Coh > coh.99

## ---- echo=FALSE, fig.show='hold', fig.width=6., fig.height=6.5----------
unwrap.phase.lower <- function(p, thresh=0) {
  while (any(p <= thresh)){
    inds <- p <= thresh
    p[inds] <- p[inds] + 360
  }
  return(p)
}

layout(matrix(1:3), heights=c(1.3,2,2))
par(mar=c(1, 3, 0.0, 0.1), oma=c(4,0.1,2,0.1), cex=0.8, las=1)

plot(Coh ~ lf, csd.f, type='l', xaxt='n', ylim=c(0,1), 
     xaxs='i',
     yaxs='i', frame=FALSE)
mtext('Coherence', font=2, line=-2.5, adj=0.1)
mtext(parse(text=sprintf("over(%s ~ 'tapers', 'conf.:' ~ %s)", k, coh.99)), cex=0.9, adj=0.95, line=-1.8, col='cyan4')
axis(1, at=-3:1, labels=FALSE)

plot(G ~ lf, csd.f, type='l', 
     yaxt='n', xaxt='n', col=NA, frame=FALSE,
     xaxs='i', yaxs='i', ylim=c(0.0, 1.01*max(pretty(csd.f$G))))
axis(1, at=csd.f$lf, tcl=0.3, col=NA, col.ticks='grey', labels = FALSE, line=0)
nsig <- 3
with(csd.f, {
  polygon(c(lf,rev(lf)), c(G + nsig*G.err, rev(G - nsig*G.err)), col='cyan', border=NA)
})
lines(G ~ lf, csd.f)
#dg <- round(coef(lm(output ~ input-1, as.data.frame(toh.dat))), 3)
#abline(h=abs(dg), lty=2)
mtext('Admittance', font=2, line=-3.3, adj=0.1)
mtext(parse(text=sprintf("%s * sigma ~ 'uncert.'", nsig)), cex=0.9, adj=0.95, line=-2.2, col='cyan4')
axis(1, at=-3:1, labels=FALSE)
axis(2)
#box()

plot(Phi ~ lf, csd.f, 
     type='l', col='lightgrey', 
     xaxs='i', frame=FALSE,
     ylim=181*c(0.65,1.08), 
     yaxs='i', yaxt='n', xaxt='n')
yat <- 180*(-2:2)/2
abline(h=yat, lty=3)
Phina <- unwrap.phase.lower(csd.f$Phi)
Phina[!is.sig] <- NA
lines(csd.f$lf, Phina)
mtext('Phase (unwrapped)', font=2, line=-2.0, adj=0.1)
axis(2)
logticks(1, major.ticks = -3:1)
axis(1, at=-3:1, labels=paste0("(",c(1000,100,10,1,"1/10"),'s)'), line=1.6, lwd=0)

## ---- fig.width=6., fig.height=3.5---------------------------------------
TohCS <- cross_spectrum(toh.dat, k=50, verbose=FALSE)
TohCS_welch <- cross_spectrum(toh.dat, k=NULL, verbose=FALSE) # turn off k to get a Welch overlapping csd
plot(Admittance ~ Period, TohCS, col=NA, log='x', main="Pore Pressure from Strain: Tohoku", xlab="Period, sec")
lines(Admittance ~ Period, TohCS_welch, col='salmon')
lines(Admittance ~ Period, TohCS, lwd=2)

