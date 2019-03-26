library(astro)


### Name: label
### Title: Add A Label To A Plot
### Aliases: label
### Keywords: data

### ** Examples

par("mar"=c(5.1,4.1,2.1,2.1))
aplot(sin, xlim=c(0,2*pi), ylim=c(-1.1,1.1), bgcol="lightgoldenrodyellow")
abline(h=0, col="grey75")
label("top", txt="Sine Function", lwd=0, bgcol="grey25", col="white")
label("bottomleft", txt="astro:label (label)", cex=2, lwd=0, bgcol=NULL)



