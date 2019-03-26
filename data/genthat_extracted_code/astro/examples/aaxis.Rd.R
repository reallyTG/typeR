library(astro)


### Name: aaxis
### Title: Add a Scientific Axis to a Plot
### Aliases: aaxis
### Keywords: data

### ** Examples

par("mar"=c(5.1,4.1,2.1,4.1))
aplot(1:1000, log10(1:1000), unlog="y", type="l", format="p", side=1:3, col="red", lwd=2)
aaxis(4, nmaj=4, nmin=9)
mtext(bquote(paste(log[10]," y ")), side=4, line=2.5)
label("bottomright", txt="astro:axis (aaxis)", cex=2, lwd=0, bgcol=NULL)



