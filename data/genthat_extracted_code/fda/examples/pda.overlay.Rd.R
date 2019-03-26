library(fda)


### Name: pda.overlay
### Title: Stability Analysis for Principle Differential Analysis
### Aliases: pda.overlay
### Keywords: smooth

### ** Examples


# This example looks at a principal differential analysis of the lip data
# in Ramsay and Silverman (2005).

# First smooth the data

lipfd <- smooth.basisPar(liptime, lip, 6, Lfdobj=int2Lfd(4),
                         lambda=1e-12)$fd
names(lipfd$fdnames) <- c("time(seconds)", "replications", "mm")

# Now we'll set up functional parameter objects for the beta coefficients.

lipbasis <- lipfd$basis
lipfd0   <- fd(matrix(0,lipbasis$nbasis,1),lipbasis)
lipfdPar <- fdPar(lipfd0,2,0)
bwtlist  <- list(lipfdPar,lipfdPar)
xfdlist  <- list(lipfd)

# Call pda

pdaList <- pda.fd(xfdlist, bwtlist)

# And plot the overlay

pda.overlay(pdaList,lwd=2,cex.lab=1.5,cex.axis=1.5)




