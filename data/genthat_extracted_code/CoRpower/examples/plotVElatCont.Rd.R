library(CoRpower)


### Name: plotVElatCont
### Title: Plotting Treatment (Vaccine) Efficacy Curves for Different
###   Correlate of Risk Relative Risks for Continuous Biomarkers
### Aliases: plotVElatCont

### ** Examples

# Example scenario with continuous biomarker, where values of rho are varied

# Set input parameters for computePower function
nCases <- 10
nControls <- 300
nCasesWithS <- 10
controlCaseRatio <- 3
VEoverall <- 0.75
risk0 <- 0.034
PlatVElowest <- 0.2
VElowest <- seq(0, VEoverall, len=8)
M <- 13
alpha <- 0.05
sigma2obs <- 1
rho <- c(1, 0.7, 0.4)
biomType <- "continuous"

# Output from computePower function is stored in an object as a list
pwr <- computePower(nCases=nCases, nCasesWithS=nCasesWithS, nControls=nControls,
                    controlCaseRatio=controlCaseRatio, risk0=risk0, VEoverall=VEoverall,
                    PlatVElowest=PlatVElowest, VElowest=VElowest, M=M, alpha=alpha,
                    sigma2obs=sigma2obs, rho=rho, biomType=biomType)

# Set parameters for plotPowerCont function
# outComputePower is a list containing output from the computePower function
outComputePower <- pwr
plotVElatCont(outComputePower=outComputePower)

## Not run: 
##D # Output from computePower function is saved in an RData file
##D computePower(..., saveDir = "myDir", saveFile = "myFile.RData")
##D # outComputePower is a character string specifying the file containing the computePower output
##D # outDir is a character string specifying the outComputePower file directory
##D outComputePower = "myFile"
##D outDir = "~/myDir"
##D plotVElatCont(outComputePower, outDir=outDir)
## End(Not run)




