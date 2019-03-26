library(bcROCsurface)


### Name: asyVarVUS
### Title: Asymptotic variance estimation for VUS
### Aliases: asyVarVUS

### ** Examples

data(EOC)

# Preparing the missing disease status
Dna <- preDATA(EOC$D, EOC$CA125)
Dfact.na <- Dna$D
Dvec.na <- Dna$Dvec

rho.out <- rhoMLogit(Dfact.na ~ CA125 + CA153 + Age, data = EOC, test = TRUE)
vus.fi <- vus("fi", T = EOC$CA125, Dvec = Dvec.na, V = EOC$V, rhoEst = rho.out,
              ci = FALSE)
var.fi <- asyVarVUS(vus.fi, T = EOC$CA125, Dvec = Dvec.na, V = EOC$V,
                   rhoEst = rho.out)

## Not run: 
##D var.bst.spe <- asyVarVUS(vus.spe, T = EOC$CA125, Dvec = Dvec.na, V = EOC$V,
##D                          rhoEst = rho.out, piEst = pi.out, BOOT = TRUE,
##D                          parallel = TRUE)
## End(Not run)





