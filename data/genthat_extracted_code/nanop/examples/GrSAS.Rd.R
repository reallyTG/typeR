library(nanop)


### Name: GrSAS
### Title: Functions to calculate the gamma baseline term for PDF
### Aliases: GrSAS GrSASCS
### Keywords: simulation

### ** Examples

## calculate baseline term for uniform particle			
gammaR <- GrSAS(r=seq(0.01, 30, 0.01), Rpart=15, 
    latticep=c(4.3, 7.02), sym="hcp", N1=4)
plot(seq(0.01, 30, 0.01), gammaR, type="l")

## compare with baseline computed as Fourier transform 
## of the total scattering function:
Zn <- createAtom("Zn")
S <- createAtom("S")
part <- simPart(atoms=list(Zn,S), r=15, latticep=c(4.3, 7.02), 
    sym="hcp")
gQSAS <- calcTotalScatt(part, type="neutron",  minQ=0.001, 
    maxQ=0.9, dQ=0.005)
gammaR2 <- calcQDepPDF(part, minR=0.01, maxR=30, dr=0.01, 
    maxQ=.85, minQ=0.001, verbose=20,
    preTotalScat=list(Q=gQSAS$Q, gQ=gQSAS$gQ))
lines(gammaR2$r, gammaR2$gr, col=2)



