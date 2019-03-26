library(MiRKAT)


### Name: KRV
### Title: Kernel RV Coefficient Test
### Aliases: KRV

### ** Examples

library(MASS)
library(GUniFrac)
data(throat.tree)
data(throat.otu.tab)
data(throat.meta)
attach(throat.meta)

set.seed(123)
n = nrow(throat.otu.tab)
Male = (Sex == "Male")**2
Smoker =(SmokingStatus == "Smoker") **2
anti =  (AntibioticUsePast3Months_TimeFromAntibioticUsage != "None")^2
cova = cbind(Male,  anti)

otu.tab.rff <- Rarefy(throat.otu.tab)$otu.tab.rff
unifracs <- GUniFrac(otu.tab.rff, throat.tree, alpha=c(0, 0.5, 1))$unifracs

D.weighted = unifracs[,,"d_1"]
D.unweighted = unifracs[,,"d_UW"]
D.BC= as.matrix(vegdist(otu.tab.rff , method="bray"))

K.weighted = D2K(D.weighted)
K.unweighted = D2K(D.unweighted)
K.BC = D2K(D.BC)

rho = 0.2
Va = matrix(rep(rho, (2*n)^2), 2*n, 2*n)+diag(1-rho, 2*n)
G = mvrnorm(n, rep(0, 2*n), Va)

#############################################################

KRV(kernel.otu = K.weighted, y = G, X = cova, kernel.y = "Gaussian") 
KRV(kernel.otu = K.weighted, kernel.y = G %*% t(G)) 



