library(nanop)


### Name: termRip
### Title: Simulate termination ripples
### Aliases: termRip
### Keywords: simulation

### ** Examples

## simulate a particle 
Cu <- createAtom("Cu")
part <- simPart(atoms=list(Cu), atomsShell=list(Cu), r=12, 
    rcore=10, latticep=4.08, latticepShell=3.89)

## calculate the PDF  
gr1 <- calcPDF(part, maxR=24, scatterLength=c(4.87, 7.97))
gr1 <- broadPDF(gr1, sigma=c(.01, .01), nAtomTypes=2) 
## normalization
gr1$gr <- 4*pi*gr1$r*gr1$gr

## calculate and substract the baseline term
gQSAS <- calcTotalScatt(part, type="neutron",  minQ=0.001, 
    maxQ=0.771, dQ=0.005, scatterLength=c(4.87, 7.97), 
    sigma=c(.01, .01))
gammaR <- calcQDepPDF(minR=0.01, maxR=24, dr=0.01, maxQ=.771, 
    minQ=0.001, verbose=50, 
    preTotalScat=list(Q=gQSAS$Q, gQ=gQSAS$gQ))
gr1$gr <- gr1$gr - gammaR$gr

plot(gr1$r, gr1$gr, type="l", xlim=c(0,10))
## simulate termination ripples
rvector <- gr1$r
gr1 <- termRip(gr1$gr, Qmax=11.881, dr=0.01, maxR=24, maxRTermRip=16)
## plot the PDF with simulated termination ripples:
lines(rvector, gr1, col=2)

#### compare with ripples due to finite value of Qmax:
## calculate scattering function
gQ <- calcTotalScatt(part, type="neutron", 
    scatterLength=c(4.87, 7.97),  sigma=c(.01, .01))
## set Qmax to a value between 11 and 13 at which scattering function reaches 
##  minimum:
t1 <- which(gQ$Q > 11)[1]
t2 <- which(gQ$Q > 13)[1]
cut <- gQ$Q[t1:t2][which(abs(gQ$gQ[t1:t2])
    ==min(abs(gQ$gQ[t1:t2]) ))[1]]
## calculate Q-dependent PDF
gr3 <- calcQDepPDF(minR=0.01, maxR=24, dr=0.01, minQ=.771, 
    maxQ=cut, verbose=50, preTotalScat=list(Q=gQ$Q, gQ=gQ$gQ))

## add Q-dependent PDF to plot:
lines(gr3$r, gr3$gr, col=4)
legend(5,7,c("PDF as returned by calcPDF", "PDF with simulated 
    termination ripples", "PDF as Fourier transform"), lty=1, 
    col=c(1,2,4))
	



