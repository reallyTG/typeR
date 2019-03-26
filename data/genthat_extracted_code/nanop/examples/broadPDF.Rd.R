library(nanop)


### Name: broadPDF
### Title: Analytically broaden the PDF
### Aliases: broadPDF
### Keywords: simulation

### ** Examples

## simulate particle
Cu1 <- createAtom("Cu", sigma=0.012) 
Cu2 <- createAtom("Cu", sigma=0.008) 
part <- simPart(atoms=list(Cu1), atomsShell=list(Cu2), r=20, 
    rcore=16, latticep=4.08, latticepShell=3.89)

## use a stochastic model for displacements 
partx <- displacePart(part, sigma=attributes(part)$sigma) 
gr1 <- calcPDF(partx, maxR=40) 

## use analytical broadening
gr2 <- calcPDF(part, maxR=40)
gr2 <- broadPDF(gr2, sigma=attributes(part)$sigma, nAtomTypes=2)

# plot PDFs calculated using both methods
matplot(gr1$r, cbind(gr1$gr, gr2$gr), type="l", lty=1, lwd=1:2)



