library(nanop)


### Name: calcPDF
### Title: Functions to calculate the PDF
### Aliases: calcPDF calcQDepPDF
### Keywords: simulation

### ** Examples

## simulate a particle 
Cu <- createAtom("Cu")
part <- simPart(atoms=list(Cu), atomsShell=list(Cu), r=8, 
    rcore=6, latticep=4.08, latticepShell=3.89)
## uniform displacement of positions
partx1 <- displacePart(part, sigma=c(.005, 0.005))
## different displacement in core than shell 
partx2 <-  displacePart(part, sigma=c(.005, .02))

## calculate and plot PDF associated with both particles 
gr1 <- calcPDF(partx1, maxR=24, scatterLength=c(4.87, 7.97), dr=.02)
gr2 <- calcPDF(partx2, maxR=24, scatterLength=c(4.87, 7.97), dr=.02)

plot(gr1$r, gr1$gr, type="l")
lines(gr2$r, gr2$gr, col=2)

## calculate scattering fucntion
gQ <- calcTotalScatt(part, type="neutron", dr=.02,
    scatterLength=c(4.87, 7.97), sigma=c(.005, .02))
t1 <- which(gQ$Q > 30)[1]
t2 <- which(gQ$Q > 34.9)[1]
cut <- gQ$Q[t1:t2][which(abs(gQ$gQ[t1:t2])
    ==min(abs(gQ$gQ[t1:t2]) ))[1]]
## calculate Q-dependent PDF
gr3 <- calcQDepPDF(part, minR=0, maxR=24, dr=0.02, minQ=.771, maxQ=cut,
    verbose=100, preTotalScat=list(Q=gQ$Q, gQ=gQ$gQ) )
## compare results with that obtained by calcPDF:
## ...normalization:
gr2 <- 4*pi*gr2$r*gr2$gr
## calculate and subtract gamma term:
gQSAS <- calcTotalScatt(part, type="neutron",  minQ=0.001, 
    maxQ=0.771, dQ=0.005,  dr=.02, 
    scatterLength=c(4.87, 7.97), sigma=c(.005, .02))
gammaR <- calcQDepPDF(part, minR=0.01, maxR=24,
    maxQ=.771, minQ=0.001, dr=.02,
    verbose=100, preTotalScat=list(Q=gQSAS$Q, gQ=gQSAS$gQ))
gr2 <- gr2 - gammaR$gr

## plot pair distribution functions associated with both technique:
plot(gr1$r, gr2, type="l")
lines(gr3$r, gr3$gr, col=2, lwd=2)




