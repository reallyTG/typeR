library(astro)


### Name: sersic
### Title: Sersic Function
### Aliases: sersic
### Keywords: data

### ** Examples


r = seq(0,8,len=500)
ns = c(0.5,1,2,4,10)
col = hsv(seq(2/3,0,len=length(ns)))

layout(c(1,2))
par("mar"=c(0,4.1,0,2.1))
par("oma"=c(5.1,0,2.1,0))

# surface brightness plot
mu = convmu(r=r, mu=20, re=1, n=ns[1])
aplot(r,abs(mu), ylim=c(28,12), type="l", nxmaj=5, nxmin=1, nymin=4, xlab="", 
ylab=bquote(paste(mu," / mag ", arcsec^{-2})), xaxs="i", yaxs="i", las=1, 
col=col[1], labels=2)
for(i in 2:length(ns)){
    mu = convmu(r=r, mu=20, re=1, n=ns[i])
    lines(r, abs(mu), col=col[i])
}
label("top", txt=bquote(paste(mu["e"]," = 20")), bty="n", inset=0.3)
text(0.9,17,labels="n = 10")
text(2,25,labels="n = 0.5")
legend("topright", legend=c(0.5,1,2,4,10), col=col, bty="n", lty=1, inset=0.03)
box()

# magnitude difference plot
md = sersic(mag=0, re=1, n=ns[1], r=r)$magdiff
aplot(r,abs(md), ylim=c(0,3), type="l", nxmaj=5, nxmin=1, nymaj=4, nymin=4, 
xlab="", ylab="m (< r) / mag", xaxs="i", yaxs="i", las=1, col=col[1])
for(i in 2:length(ns)){
    md = sersic(mag=0, re=1, n=ns[i], r=r)$magdiff
    lines(r, abs(md), col=col[i])
}
abline(h=abs(sersic(mag=0, re=1, n=1, r=1)$magdiff), lty=2)
label("top", txt=bquote(paste(m[tot]," = 0")), bty="n", inset=0.3)
text(7,0.4,labels="n = 10")
text(1,2,labels="n = 0.5")
mtext(bquote(paste("r / ",r[e],sep="")), side=1, line=2.5)
box()




