library(CoRpower)


### Name: plotRRgradVE
### Title: Plotting of the Ratio of Relative Risks for Higher/Lower Latent
###   Subgroups against Correlate of Risk Effect Size for Trichotomous
###   Biomarkers
### Aliases: plotRRgradVE

### ** Examples

# Example scenario with trichotomous biomarker, where values of rho are varied

# Set input parameters for computePower function
nCases <- 10
nControls <- 300
nCasesWithS <- 10
controlCaseRatio <- 3
VEoverall <- 0.75
risk0 <- 0.034
VElat0 <- seq(0, VEoverall, len=10)
VElat1 <- rep(VEoverall, 10)
Plat0 <- P0 <- 0.2
Plat2 <- P2 <- 0.6
M <- 20
alpha <- 0.05
sigma2obs <- 1
rho <- c(1, 0.7, 0.4)
biomType <- "trichotomous"

# Output from computePower function is stored in an object as a list
pwr <- computePower(nCases=nCases, nControls=nControls, nCasesWithS=nCasesWithS,
                    controlCaseRatio=controlCaseRatio, risk0=risk0, VEoverall=VEoverall,
                    Plat0=Plat0, Plat2=Plat2, P0=P0, P2=P2, VElat0=VElat0,
                    VElat1=VElat1, M=M, alpha=alpha, sigma2obs=sigma2obs, rho=rho,
                    biomType=biomType)

# Set parameters for plotPowerCont function
# outComputePower is a list containing output from the computePower function
outComputePower <- pwr
legendText <- paste0("rho = ", c(1, 0.7, 0.4))
plotRRgradVE(outComputePower=outComputePower, legendText=legendText)

## Not run: 
##D # Output from computePower function is saved in an RData file
##D computePower(..., saveDir = "myDir", saveFile = "myFile.RData")
##D # outComputePower is a character string specifying the file containing the computePower output
##D # outDir is a character string specifying the outComputePower file directory
##D outComputePower = "myFile"
##D outDir = "~/myDir"
##D legendText <- paste0("rho = ", c(1, 0.7, 0.4))
##D plotRRgradVE(outComputePower, outDir=outDir, legendText = legendText)
## End(Not run)




