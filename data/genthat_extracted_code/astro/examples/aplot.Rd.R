library(astro)


### Name: aplot
### Title: Scientific X-Y Plotting
### Aliases: aplot
### Keywords: data

### ** Examples

# example #1
layout(1)
par("mar"=c(5.1,4.1,2.1,2.1))
par("oma"=c(0,0,0,0))
aplot(sin, xlim=c(0,2*pi), ylim=c(-1.1,1.1), bgcol="lightgoldenrodyellow")
abline(h=0, col="grey75")
label("top", txt="Sine Function", lwd=0, bgcol="grey25", col="white")
label("bottomleft", txt="astro:label (label)", cex=2, lwd=0, bgcol=NULL)

# example #2
layout(1)
par("mar"=c(5.1,4.1,2.1,4.1))
par("oma"=c(0,0,0,0))
aplot(1:1000, log10(1:1000), unlog="y", type="l", yformat="p", side=1:3, 
col="red", lwd=2)
aaxis(4, nmaj=4, nmin=9)
mtext(bquote(paste(log[10]," y ")), side=4, line=2.5)
label("bottomright", txt="astro:axis (aaxis)", cex=2, lwd=0, bgcol=NULL)

# example #3
layout(cbind(c(1,2),c(3,3)), widths=c(5,1))
par("mar"=c(0,0,0,1))
par("oma"=c(3.1,3.1,3.1,2.1))
aplot(rnorm(1000), rnorm(1000), rnorm(1000), pch=17, zlim=c(-1,1), xlim=c(-3,3), 
ylim=c(-3,3), labels=2:3)
grid()
label("topleft", txt="astro:colourbar (acb)", cex=2, lwd=0, bgcol=NULL)
aplot(rnorm(1000), rnorm(1000), rnorm(1000), pch=16, zlim=c(-1,1), xlim=c(-3,3), 
ylim=c(-3,3), labels=1:2)
grid()
acb(zlim=c(-1,1), zlab="z-axis label")

# example #4
layout(1)
par("mar"=c(5.1,4.1,4.1,5.1))
par("oma"=c(0,0,0,0))
aplot(rnorm(1000), rnorm(1000), rnorm(1000), cb=TRUE, zlim=c(-1,1), pch=16, 
xlab="x-axis label", ylab="y-axis label", zlab="z-axis label", bgcol="grey95")
label("topleft", txt="astro:plot (aplot)", cex=2, lwd=0, bgcol=NULL)



