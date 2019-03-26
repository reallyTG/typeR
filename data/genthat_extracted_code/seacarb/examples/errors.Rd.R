library(seacarb)


### Name: errors
### Title: Uncertainty propagation for computed marine carbonate system
###   variables
### Aliases: errors
### Keywords: utilities

### ** Examples


## 1) For the input pair ALK and DIC (var1 and var2 when flag=15),
## compute resulting uncertainty from given uncertainty on ALK and DIC (5 umol/kg)
## and default uncertainties in dissociation constants and total boron
## using the default method (Gaussian)
errors(flag=15, var1=2300e-6, var2=2000e-6, S=35, T=25, P=0, Patm=1.0, Pt=0, Sit=0, 
       evar1=5e-6, evar2=5e-6, eS=0, eT=0, ePt=0, eSit=0, 
       pHscale="T", kf="pf", k1k2="l", ks="d", b="u74")
## Typical output:
## H             pH          CO2           fCO2      pCO2      HCO3          ...
## 3.721614e-10  0.01796767  5.441869e-07  19.25338  19.31504  9.170116e-06  ...

## 2) Do the same as in one, but assign a 4% uncertainty to total boron
##    This uncertainty is the amount by which estimates from Lee et al (2010) and 
##    Uppstrom (1974) differ. The default for the latter is eBt=0.02.
errors(flag=15, var1=2300e-6, var2=2000e-6, S=35, T=25, P=0, Patm=1.0, Pt=0, Sit=0, 
       evar1=5e-6, evar2=5e-6, eS=0, eT=0, ePt=0, eSit=0, eBt=0.04,
       pHscale="T", kf="pf", k1k2="l", ks="d", b="u74")

## 3) For the input pair pH and ALK (var1 and var2 when flag=8)
## compute standard errors in output variables from errors in input variables, i.e., 
## for pH (0.005 pH units) and in ALK (5 umol/kg), along with
## errors in total dissolved inorganic phosphorus (0.1 umol/kg) and
## total dissolved inorganic silicon (2 umol/kg) concentrations, while
## assuming no uncertainty in dissociation constants & boron, using the Gaussian method:
errors(flag=8, var1=8.25, var2=2300e-6,  S=35, T=25, P=0, Patm=1.0, Pt=0, Sit=0, 
       evar1=0.005, evar2=5e-6, eS=0, eT=0, ePt=0.1, eSit=2, epK=0, eBt=0,
       method="ga", pHscale="T", kf="pf", k1k2="l", ks="d", b="u74")

## 4) For the input pair pCO2 and pH (var1 and var2 when flag=21)
## compute standard errors in output variables from errors in input variables, i.e., 
## for pCO2 (2 uatm) and pH (0.005 pH units), with no uncertainties in Pt and Sit
## nor in the dissociation constants BUT a perfect anticorrelation between pCO2 and pH,
## (the input pair) using the Method of moments:
errors(flag=21, var1=400, var2=8.1,  S=35, T=25, P=0, Patm=1.0, Pt=0, Sit=0, 
       evar1=2, evar2=0.005, eS=0, eT=0, ePt=0.0, eSit=0, epK=0, eBt=0, 
       method="mo", r=-1.0, pHscale="T", kf="pf", k1k2="l", ks="d", b="u74")

## 5) Use vectors as arguments and compute errors on all output variables
## using Monte Carlo method taking into account input errors on pH, ALK, DIC
## and dissociation constants (pKx)
flag <- c(8, 15, 8)
var1 <- c(8.2, 0.002394, 8.25)
var2 <- c(0.002343955, 0.002017, 2400e-6)
S <- c(35, 35, 30)
T <- c(25, 25, 22)
P <- 0
Pt <- 0
Sit <- 0
evar1 <- c(0.005, 2e-6, 0.005)
evar2 <- c(2e-6, 2e-6, 2e-6)
epKx <- c(0.002, 0.01, 0.02, 0.01, 0.01, 0.01, 0.01)
eBtx = 0.01
method <- "mc"
kf <- "pf"
k1k2 <- "l"
pHscale <- "T"
b <- "u74"
## NOTE that the following is executable but enclosed in "donttest" 
## because it takes too long to run when submiting to CRAN
## and is therefore rejected
## No test: 
errors(flag=flag, var1=var1, var2=var2, S=S, T=T, P=P, Pt=Pt, Sit=Sit, 
       evar1=evar1, evar2=evar2, eS=0, eT=0, ePt=0, eSit=0, epK=epKx, eBt=eBtx,
       method=method, runs=10000, kf=kf, k1k2=k1k2, pHscale=pHscale, b=b)
## End(No test)



