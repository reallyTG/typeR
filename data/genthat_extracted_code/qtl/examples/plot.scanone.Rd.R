library(qtl)


### Name: plot.scanone
### Title: Plot LOD curves
### Aliases: plot.scanone
### Keywords: hplot

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(1,13))
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2,step=2.5)
out.mr <- scanone(fake.f2, method="mr")
out.em <- scanone(fake.f2, method="em")
plot(out.mr)
plot(out.mr, out.em, chr=c(1,13), lty=1, col=c("violetred","black"))
out.hk <- scanone(fake.f2, method="hk")
plot(out.hk, chr=c(1,13), add=TRUE, col="slateblue")

plot(out.hk, chr=13, show.marker.names=TRUE)

plot(out.hk, bandcol="gray70")

# plot points rather than lines
plot(out.hk, bandcol="gray70", type="p", cex=0.3, pch=21, bg="slateblue")



