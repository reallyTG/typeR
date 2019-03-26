library(CoRpower)


### Name: plotPowerTri
### Title: Plotting of Power versus Correlate of Risk Effect Size for
###   Dichotomous and Trichotomous Biomarkers
### Aliases: plotPowerTri

### ** Examples

# Example scenario with trichotomous biomarker, where values of controlCaseRatio are varied

# Set input parameters for computePower function
nCases <- 10
nControls <- 300
nCasesWithS <- 10
controlCaseRatio <- 5
VEoverall <- 0.75
risk0 <- 0.034
VElat0 <- seq(0, VEoverall, len=5)
VElat1 <- rep(VEoverall, 5)
Plat0 <- P0 <- 0.2
Plat2 <- P2 <- 0.6
sens <- spec <- 0.8
FP0 <- FN2 <- 0
M <- 50
alpha <- 0.05
biomType <- "trichotomous"

# Output from computePower function is stored in an object as a list
pwr1 <- computePower(nCases=nCases, nControls=nControls, nCasesWithS=nCasesWithS,
                     controlCaseRatio=controlCaseRatio, risk0=risk0,
                     VEoverall=VEoverall, Plat0=Plat0, Plat2=Plat2, P0=P0, P2=P2,
                     VElat0=VElat0, VElat1=VElat1, M=M, alpha=alpha, spec=spec,
                     FP0=FP0, sens=sens, FN2=FN2, biomType=biomType)

controlCaseRatio <- 3
pwr2 <- computePower(nCases=nCases, nControls=nControls, nCasesWithS=nCasesWithS,
                     controlCaseRatio=controlCaseRatio, risk0=risk0,
                     VEoverall=VEoverall, Plat0=Plat0, Plat2=Plat2, P0=P0, P2=P2,
                     VElat0=VElat0, VElat1=VElat1, M=M, alpha=alpha, spec=spec,
                     FP0=FP0, sens=sens, FN2=FN2, biomType=biomType)

# Set parameters for plotPowerTri function
# outComputePower is a list of lists containing outputs from the computePower function
outComputePower <- list(pwr1, pwr2)
legendText <- paste0("controls:cases = ", c("5:1","3:1"))
plotPowerTri(outComputePower=outComputePower, legendText=legendText)

## Not run: 
##D # outComputePower is a character vector specifying the files containing computePower output
##D # outDir is a character vector specifying the outComputePower file directories
##D outComputePower = c("myFile1", "myFile2")
##D outDir = rep("~/myDir", 2)
##D legendText <- paste0("controls:cases = ", c("5:1","3:1"))
##D plotPowerTri(outComputePower, outDir=outDir, legendText = legendText)
## End(Not run)




