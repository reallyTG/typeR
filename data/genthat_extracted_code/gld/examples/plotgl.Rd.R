library(gld)


### Name: plotgl
### Title: Plots of density and distribution function for the generalised
###   lambda distribution
### Aliases: plotgl plotglc plotgld
### Keywords: distribution hplot aplot

### ** Examples

plotgld(0,1.4640474,.1349,.1349,main="Approximation to Standard Normal", 
sub="But you can see this isn't on infinite support")

plotgld(1.42857143,1,.7,.3,main="The whale")
plotglc(1.42857143,1,.7,.3)
plotgld(0,-1,5,-0.3,param="rs")
plotgld(0,-1,5,-0.3,param="rs",xlim=c(1,2))
# A bizarre shape from the RS paramterisation
plotgld(0,1,5,-0.3,param="fmkl")
plotgld(10/3,1,.3,-1,truncate=1e-3)

plotgld(0,1,.0742,.0742,col.or.type=2,param="rs",
main="All distributions have the same moments",
sub="The full Range of all distributions is shown")
plotgld(0,1,6.026,6.026,col.or.type=3,new.plot=FALSE,param="rs")
plotgld(0,1,35.498,2.297,col.or.type=4,new.plot=FALSE,param="rs")
legend(0.25,3.5,lty=1,col=c(2,3,4),legend=c("(0,1,.0742,.0742)",
"(0,1,6.026,6.026)","(0,1,35.498,2.297)"),cex=0.9)
# An illustration of problems with moments as a method of characterising shape




