library(CoRpower)


### Name: computePower
### Title: Power Calculations for Assessing Intermediate Biomarkers as
###   Correlates of Risk in the Active Treatment Group in Clinical Efficacy
###   Trials, Accounting for Biomarker's Measurement Error and Treatment
###   Efficacy
### Aliases: computePower

### ** Examples


## Trichotomous biomarker, Approach 1, varying sens and spec ##
## Specify sens, spec, FP0, FN2
nCases <- 32
nControls <- 1000
nCasesWithS <- 32
controlCaseRatio <- 5
VEoverall <- 0.75
risk0 <- 0.034
VElat0 <- seq(0, VEoverall, len=20)  # 20 data points for the power curve
VElat1 <- rep(VEoverall, 20)
Plat0 <- 0.2
Plat2 <- 0.6
P0 <- Plat0  # different values of P0 can be set
P2 <- Plat2  # different values of P2 can be set
sens <- spec <- c(1, 0.9, 0.8, 0.7)
FP0 <- FN2 <- rep(0, 4)
M <- 5
alpha <- 0.05
biomType <- "trichotomous"
computePower(nCases=nCases, nControls=nControls, nCasesWithS=nCasesWithS,
             controlCaseRatio=controlCaseRatio, VEoverall=VEoverall,
             risk0=risk0, VElat0=VElat0, VElat1=VElat1, Plat0=Plat0,
             Plat2=Plat2, P0=P0, P2=P2, M=M, alpha=alpha, spec=spec,
             FP0=FP0, sens=sens, FN2=FN2, biomType=biomType)

## Not run: 
##D ## Trichotomous biomarker, Approach 2, varying rho ##
##D ## Specify rho and sigma2obs
##D 
##D nCases <- 32
##D nControls <- 1000
##D nCasesWithS <- 32
##D controlCaseRatio <- 5
##D VEoverall <- 0.75
##D risk0 <- 0.034
##D VElat0 <- seq(0, VEoverall, len=20)
##D VElat1 <- rep(VEoverall, 20)
##D Plat0 <- 0.2
##D Plat2 <- 0.6
##D P0 <- Plat0
##D P2 <- Plat2
##D M <- 5
##D alpha <- 0.05
##D sigma2obs <- 1
##D rho <- c(1, 0.9, 0.7, 0.5)
##D biomType <- "trichotomous"
##D computePower(nCases=nCases, nControls=nControls, nCasesWithS=nCasesWithS,
##D              controlCaseRatio=controlCaseRatio, VEoverall=VEoverall, risk0=risk0,
##D              VElat0=VElat0, VElat1=VElat1, Plat0=Plat0, Plat2=Plat2, P0=P0, P2=P2,
##D              M=M, alpha=alpha, sigma2obs=sigma2obs, rho=rho, biomType=biomType)
##D 
##D 
##D ## dichotomous biomarker, Approach 2, varying rho ##
##D ## Plat0 + Plat2 = 1
##D 
##D nCases <- 32
##D nControls <- 1000
##D nCasesWithS <- 32
##D controlCaseRatio <- 5
##D VEoverall <- 0.75
##D risk0 <- 0.034
##D VElat0 <- seq(0, VEoverall, len=20)  # 20 data points for the power curve
##D VElat1 <- rep(0, 20)  # will not be used by function
##D Plat0 <- 0.2
##D Plat2 <- 1 - Plat0
##D P0 <- Plat0
##D P2 <- Plat2
##D M <- 5
##D alpha <- 0.05
##D sigma2obs <- 1
##D rho <- c(1, 0.9, 0.7, 0.5)
##D biomType <- "dichotomous"
##D computePower(nCases=nCases, nControls=nControls, nCasesWithS=nCasesWithS,
##D              controlCaseRatio=controlCaseRatio, VEoverall=VEoverall, risk0=risk0,
##D              VElat0=VElat0, VElat1=VElat1, Plat0=Plat0, Plat2=Plat2, P0=P0, P2=P2,
##D              M=M, alpha=alpha, sigma2obs=sigma2obs, rho=rho, biomType=biomType)
##D 
##D 
##D ## Continuous biomarker, varying rho ##
##D 
##D nCases <- 32
##D nControls <- 1000
##D nCasesWithS <- 32
##D controlCaseRatio <- 5
##D VEoverall <- 0.75
##D risk0 <- 0.034
##D PlatVElowest <- 0.2
##D VElowest <- seq(0, VEoverall, len=20)
##D M <- 5
##D alpha <- 0.05
##D sigma2obs <- 1
##D rho <- c(1, 0.9, 0.7, 0.5)
##D biomType <- "continuous"
##D computePower(nCases=nCases, nControls=nControls, nCasesWithS=nCasesWithS,
##D              controlCaseRatio=controlCaseRatio, VEoverall=VEoverall, risk0=risk0,
##D              PlatVElowest=PlatVElowest, VElowest=VElowest, M=M, alpha=alpha,
##D              sigma2obs=sigma2obs, rho=rho, biomType=biomType)
##D 
##D 
##D ## Continuous biomarker, case-cohort sampling design, varying p ##
##D nCases <- 32
##D nControls <- 1000
##D nCasesWithS <- 32
##D VEoverall <- 0.75
##D risk0 <- 0.034
##D PlatVElowest <- 0.2
##D VElowest <- seq(0, VEoverall, len=20)
##D M <- 5
##D alpha <- 0.05
##D sigma2obs <- 1
##D rho <- 0.9
##D biomType <- "continuous"
##D cohort <- TRUE
##D p <- 0.01
##D computePower(nCases=nCases, nControls=nControls, nCasesWithS=nCasesWithS,
##D              VEoverall=VEoverall, risk0=risk0, PlatVElowest=PlatVElowest,
##D              VElowest=VElowest, M=M, alpha=alpha, sigma2obs=sigma2obs,
##D              rho=rho, biomType=biomType, cohort=cohort, p=p)
##D p <- 0.02
##D computePower(nCases=nCases, nControls=nControls, nCasesWithS=nCasesWithS,
##D              VEoverall=VEoverall, risk0=risk0, PlatVElowest=PlatVElowest,
##D              VElowest=VElowest, M=M, alpha=alpha, sigma2obs=sigma2obs,
##D              rho=rho, biomType=biomType, cohort=cohort, p=p)
##D p <- 0.03
##D computePower(nCases=nCases, nControls=nControls, nCasesWithS=nCasesWithS,
##D              VEoverall=VEoverall, risk0=risk0, PlatVElowest=PlatVElowest,
##D              VElowest=VElowest, M=M, alpha=alpha, sigma2obs=sigma2obs,
##D              rho=rho, biomType=biomType, cohort=cohort, p=p)
##D 
##D 
##D ## Continuous biomarker, saving output, varying sample sizes ##
##D 
##D nCases <- 32
##D nControls <- 1000
##D nCasesWithS <- 32
##D controlCaseRatio <- 5
##D VEoverall <- 0.75
##D risk0 <- 0.034
##D PlatVElowest <- 0.2
##D VElowest <- seq(0, VEoverall, len=20)
##D M <- 5
##D alpha <- 0.05
##D sigma2obs <- 1
##D rho <- c(1, 0.9, 0.7, 0.5)
##D biomType <- "continuous"
##D saveDir <- "~/myDir"
##D saveFile <- "MyFile"
##D computePower(nCases=nCases, nCasesWithS=nCasesWithS, nControls=nControls,
##D              controlCaseRatio=controlCaseRatio, VEoverall=VEoverall,
##D              risk0=risk0, PlatVElowest=PlatVElowest, VElowest=VElowest,
##D              M=M, alpha=alpha, sigma2obs=sigma2obs, rho=rho,
##D              biomType=biomType, saveDir=saveDir, saveFile=saveFile)
## End(Not run)




