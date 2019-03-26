library(FSA)


### Name: nlsTracePlot
### Title: Adds model fits from nls iterations to active plot.
### Aliases: nlsTracePlot
### Keywords: plot

### ** Examples

## Examples following a successful fit
vb1 <- vbFuns()
fit1 <- nls(tl~vb1(age,Linf,K,t0),data=SpotVA1,start=list(Linf=12,K=0.3,t0=0))
plot(tl~age,data=SpotVA1,pch=21,bg="gray40")
nlsTracePlot(fit1,vb1,legend="bottomright")

r1 <- srFuns("Ricker")
fitSR1 <- nls(log(recruits)~log(r1(stock,a,b)),data=CodNorwegian,start=list(a=3,b=0.03))
plot(recruits~stock,data=CodNorwegian,pch=21,bg="gray40",xlim=c(0,200))
nlsTracePlot(fitSR1,r1)

# no plot, but returns trace results as a matrix
( tmp <- nlsTracePlot(fitSR1,r1,add=FALSE) )

## Not run: 
##D if (require(FSAdata)) {
##D   data(BSkateGB,package="FSAdata")
##D   wtr <- filterD(BSkateGB,season=="winter")
##D   bh1 <- srFuns()
##D   trc <- capture.output(try(
##D   fitSR1 <- nls(recruits~bh1(spawners,a,b),wtr,
##D                 start=srStarts(recruits~spawners,data=wtr),trace=TRUE)
##D   ))
##D   plot(recruits~spawners,data=wtr,pch=21,bg="gray40")
##D   nlsTracePlot(trc,bh1)
##D   # zoom in on y-axis
##D   plot(recruits~spawners,data=wtr,pch=21,bg="gray40",ylim=c(0.02,0.05))
##D   nlsTracePlot(trc,bh1,legend="top")
##D   # return just the trace results
##D   ( tmp <- nlsTracePlot(trc,bh1,add=FALSE) )
##D }
## End(Not run)




