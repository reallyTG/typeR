## ------------------------------------------------------------------------
library(CoRpower)
computeN(Nrand = 4100,          # participants randomized to vaccine arm
         tau = 3.5,             # biomarker sampling timepoint
         taumax = 24,           # end of follow-up
         VEtauToTaumax = 0.75,  # VE between 'tau' and 'taumax'
         VE0toTau = 0.75/2,     # VE between 0 and 'tau'
         risk0 = 0.034,         # placebo-group endpoint risk between 'tau' and 'taumax'
         dropoutRisk = 0.1,     # dropout risk between 0 and 'taumax'
         propCasesWithS = 1)    # proportion of observed cases with measured S

## ---- eval=FALSE---------------------------------------------------------
#  pwr <- computePower(nCases = 32,
#                      nControls = 3654,
#                      nCasesWithS = 32,
#                      controlCaseRatio = 5,         # scalar, i.e., separate calls for 5, 3, 1
#                      VEoverall = 0.75,             # overall VE
#                      risk0 = 0.034,                # placebo-group endpoint risk from tau - taumax
#                      VElat0 = seq(0, VEoverall, len=100), # grid of VE (V/P) among lower protected
#                      VElat1 = rep(VEoverall, 100), # grid of VE (V/P) among medium protected
#                      Plat0 = 0.2,                  # prevalence of lower protected
#                      Plat2 = 0.6,                  # prevalence of higher protected
#                      P0 = 0.2,                     # probability of low biomarker response
#                      P2 = 0.6,                     # probability of high biomarker response
#                      sens = 0.8, spec = 0.8, FP0 = 0, FN2 = 0,
#                      M = 1000,                     # number of simulated clinical trials
#                      alpha = 0.05,                 # two-sided Wald test Type 1 error rate
#                      biomType = "trichotomous")    # "continuous" by default

## ---- eval=FALSE---------------------------------------------------------
#  plotPowerTri(outComputePower = list(pwr5to1, pwr3to1, pwr1to1),  # 'computePower' output lists
#               legendText = paste0("Control:Case = ", c("5:1", "3:1", "1:1")))

## ---- eval=FALSE---------------------------------------------------------
#  computePower(..., saveDir = "myDir", saveFile = "myFile.RData")
#  plotPowerTri(outComputePower = c("myFile1", "myFile2", "myFile3"), # 'computePower' output files
#               outDir = rep("~/myDir", 3),                           # path to each myFilex.RData
#               legendText = paste0("Control:Case = ", c("5:1", "3:1", "1:1")))

## ---- eval=FALSE---------------------------------------------------------
#  pwr <- computePower(nCases = 32,
#                      nControls = 3654,
#                      nCasesWithS = 32,
#                      controlCaseRatio = 5,         # n^S_controls : n^S_cases ratio
#                      VEoverall = 0.75,             # overall VE
#                      risk0 = 0.034,                # placebo-group endpoint risk from tau - taumax
#                      VElat0 = seq(0, VEoverall, len=100), # grid of VE (V/P) among lower protected
#                      VElat1 = rep(VEoverall, 100), # grid of VE (V/P) among medium protected
#                      Plat0 = 0.2,                  # prevalence of lower protected
#                      Plat2 = 0.6,                  # prevalence of higher protected
#                      P0 = 0.2,                     # probability of low biomarker response
#                      P2 = 0.6,                     # probability of high biomarker response
#                      sens = c(1, 0.9, 0.8, 0.7), spec = c(1, 0.9, 0.8, 0.7),
#                      FP0 = 0, FN2 = 0,
#                      M = 1000,                     # number of simulated clinical trials
#                      alpha = 0.05,                 # two-sided Wald test Type 1 error rate
#                      biomType = "trichotomous")    # "continuous" by default

## ---- eval=FALSE---------------------------------------------------------
#  plotPowerTri(outComputePower = pwr,
#               legendText = paste0("Sens = Spec = ", c(1, 0.9, 0.8, 0.7)))

## ---- eval=FALSE---------------------------------------------------------
#  pwr <- computePower(nCases = 32,
#                      nControls = 3654,
#                      nCasesWithS = 32,
#                      controlCaseRatio = 5,         # n^S_controls : n^S_cases ratio
#                      VEoverall = 0.75,             # overall VE
#                      risk0 = 0.034,                # placebo-group endpoint risk from tau - taumax
#                      VElat0 = seq(0, VEoverall, len=100), # grid of VE (V/P) among lower protected
#                      VElat1 = rep(VEoverall, 100), # grid of VE (V/P) among medium protected
#                      Plat0 = 0.05,               # scalar; separate calls for 0.05, 0.1, 0.15, 0.2
#                      Plat2 = 0.15,               # scalar; separate calls for 0.15, 0.3, 0.45, 0.6
#                      P0 = 0.05,                  # scalar; separate calls for 0.05, 0.1, 0.15, 0.2
#                      P2 = 0.15,                  # scalar; separate calls for 0.15, 0.3, 0.45, 0.6
#                      sens = 0.8, spec = 0.8, FP0 = 0, FN2 = 0,
#                      M = 1000,                     # number of simulated clinical trials
#                      alpha = 0.05,                 # two-sided Wald test Type 1 error rate
#                      biomType = "trichotomous")    # "continuous" by default

## ---- eval=FALSE---------------------------------------------------------
#  plotPowerTri(outComputePower = list(pwr1, pwr2, pwr3, pwr4),
#               legendText = c("Plat0=0.05, Plat2=0.15",
#                              "Plat0=0.1, Plat2=0.3",
#                              "Plat0=0.15, Plat2=0.45",
#                              "Plat0=0.2, Plat2=0.6"))

## ---- eval=FALSE---------------------------------------------------------
#  pwr <- computePower(nCases = 32,
#                      nControls = 3654,
#                      nCasesWithS = 32,
#                      controlCaseRatio = 5,         # n^S_controls : n^S_cases ratio
#                      VEoverall = 0.75,             # overall VE
#                      risk0 = 0.034,                # placebo-group endpoint risk from tau - taumax
#                      VElat0 = seq(0, VEoverall, len=100), # grid of VE (V/P) among lower protected
#                      VElat1 = rep(VEoverall, 100), # grid of VE (V/P) among medium protected
#                      Plat0 = 0.2,                  # prevalence of lower protected
#                      Plat2 = 0.6,                  # prevalence of higher protected
#                      P0 = 0.2,                     # probability of low biomarker response
#                      P2 = 0.6,                     # probability of high biomarker response
#                      sigma2obs = 1,                # variance of observed biomarker S
#                      rho = c(1, 0.9, 0.7, 0.5),    # protection-relevant fraction of variance of S
#                      M = 1000,                     # number of simulated clinical trials
#                      alpha = 0.05,                 # two-sided Wald test Type 1 error rate
#                      biomType = "trichotomous")    # "continuous" by default

## ---- eval=FALSE---------------------------------------------------------
#  plotPowerTri(outComputePower = pwr,
#               legendText = paste0("rho = ", c(1, 0.9, 0.7, 0.5)))

## ---- eval=FALSE---------------------------------------------------------
#  plotRRgradVE(outComputePower = pwr,  # 'computePower' output list
#               legendText = paste0("rho = ", c(1, 0.9, 0.7, 0.5)))

## ---- eval=FALSE---------------------------------------------------------
#  computePower(..., saveDir = "myDir", saveFile = "myFile.RData")
#  plotRRgradVE(outComputePower = "myFile",    # file with 'computePower' output
#               outDir = "~/myDir",            # path to myFile.RData
#               legendText = paste0("rho = ", c(1, 0.9, 0.7, 0.5)))

## ---- eval=FALSE---------------------------------------------------------
#  plotROCcurveTri(Plat0 = 0.2,
#                  Plat2 = c(0.2, 0.3, 0.4, 0.5),
#                  P0 = seq(0.90, 0.10, len=25),
#                  P2 = seq(0.10, 0.90, len=25),
#                  rho = c(`, 0.9, 0.7, 0.5))

## ---- eval=FALSE---------------------------------------------------------
#  pwr <- computePower(nCases = 32,
#                      nControls = 3654,
#                      nCasesWithS = 32,
#                      controlCaseRatio = 5,         # n^S_controls : n^S_cases ratio
#                      VEoverall = 0.75,             # overall VE
#                      risk0 = 0.034,                # placebo-group endpoint risk from tau - taumax
#                      VElat0 = seq(0, VEoverall, len=100), # grid of VE (V/P) among lower protected
#                      VElat1 = rep(VEoverall, 100), # grid of VE (V/P) among medium protected
#                      Plat0 = 0.05,               # scalar; separate calls for 0.05, 0.1, 0.15, 0.2
#                      Plat2 = 0.15,               # scalar; separate calls for 0.15, 0.3, 0.45, 0.6
#                      P0 = 0.05,                  # scalar; separate calls for 0.05, 0.1, 0.15, 0.2
#                      P2 = 0.15,                  # scalar; separate calls for 0.15, 0.3, 0.45, 0.6
#                      sigma2obs = 1,                # variance of observed biomarker S
#                      rho = 0.9,                    # protection-relevant fraction of variance of S
#                      M = 1000,                     # number of simulated clinical trials
#                      alpha = 0.05,                 # two-sided Wald test Type 1 error rate
#                      biomType = "trichotomous")    # "continuous" by default

## ---- eval=FALSE---------------------------------------------------------
#  plotPowerTri(outComputePower = list(pwr1, pwr2, pwr3, pwr4),
#               legendText = c("Plat0=0.05, Plat2=0.15",
#                              "Plat0=0.1, Plat2=0.3",
#                              "Plat0=0.15, Plat2=0.45",
#                              "Plat0=0.2, Plat2=0.6"))

## ---- eval=FALSE---------------------------------------------------------
#  pwr <- computePower(nCases = c(25, 32, 35, 40),
#                      nControls = c(3661, 3654, 3651, 3646),
#                      nCasesWithS = c(25, 32, 35, 40),
#                      controlCaseRatio = 5,         # n^S_controls : n^S_cases ratio
#                      VEoverall = 0.75,             # overall VE
#                      risk0 = 0.034,                # placebo-group endpoint risk fom tau - taumax
#                      VElat0 = seq(0, VEoverall, len=100), # grid of VE (V/P) among lower protected
#                      VElat1 = rep(VEoverall, 100), # grid of VE (V/P) among medium protected
#                      Plat0 = 0.2,                  # prevalence of lower protected
#                      Plat2 = 0.6,                  # prevalence of higher protected
#                      P0 = 0.2,                     # probability of low biomarker response
#                      P2 = 0.6,                     # probability of high biomarker response
#                      sigma2obs = 1,                # variance of observed biomarker S
#                      rho = 0.9,                    # protection-relevant fraction of variance of S
#                      M = 1000,                     # number of simulated clinical trials
#                      alpha = 0.05,                 # two-sided Wald test Type 1 error rate
#                      biomType = "trichotomous")    # "continuous" by default

## ---- eval=FALSE---------------------------------------------------------
#  plotPowerTri(outComputePower = pwr,
#               legendText = paste0("nCases = ", c(25, 32, 35, 40)))

## ---- eval=FALSE---------------------------------------------------------
#  pwr <- computePower(nCases = c(25, 32, 35, 40),
#                      nControls = c(3661, 3654, 3651, 3646),
#                      nCasesWithS = c(25, 32, 35, 40),
#                      controlCaseRatio = 5,         # n^S_controls : n^S_cases ratio
#                      VEoverall = 0.75,             # overall VE
#                      risk0 = 0.034,                # placebo-group endpoint risk from tau - taumax
#                      VElat0 = seq(0, VEoverall, len=100), # grid of VE (V/P) among lower protected
#                      VElat1 = rep(VEoverall, 100), # grid of VE (V/P) among medium protected
#                      Plat0 = 0.2,                  # prevalence of lower protected
#                      Plat2 = 0.8,                  # prevalence of higher protected
#                      P0 = 0.2,                     # probability of low biomarker response
#                      P2 = 0.8,                     # probability of high biomarker response
#                      sigma2obs = 1,                # variance of observed biomarker S
#                      rho = 0.9,                    # protection-relevant fraction of variance of S
#                      M = 1000,                     # number of simulated clinical trials
#                      alpha = 0.05,                 # two-sided Wald test Type 1 error rate
#                      biomType = "binary")          # "continuous" by default

## ---- eval=FALSE---------------------------------------------------------
#  plotPowerTri(outComputePower = pwr,
#               legendText = paste0("nCases = ", c(25, 32, 35, 40)))

## ---- eval=FALSE---------------------------------------------------------
#  pwr <- computePower(nCases = 32,
#                      nControls = 3654,
#                      nCasesWithS = 32,
#                      controlCaseRatio = 5,        # n^S_controls : n^S_cases ratio
#                      VEoverall = 0.75,            # overall VE
#                      risk0 = 0.034,               # placebo-group endpoint risk from tau - taumax
#                      PlatVElowest = 0.2,          # prevalence of VE_lowest
#                      VElowest = seq(0, VEoverall, len=100), # lowest VE for true biomarker X*<=nu
#                      sigma2obs = 1,               # variance of observed biomarker S
#                      rho = c(1, 0.9, 0.7, 0.5)    # protection-relevant fraction of variance of S
#                      M = 1000,                    # number of simulated clinical trials
#                      alpha = 0.05,                # two-sided Wald test Type 1 error rate
#                      biomType = "continuous")     # "continuous" by default

## ---- eval=FALSE---------------------------------------------------------
#  plotPowerCont(outComputePower = pwr,          # output list from 'computePower'
#                legendText = paste0("rho = ", c(1, 0.9, 0.7, 0.5)))

## ---- eval=FALSE---------------------------------------------------------
#  computePower(..., saveDir = "myDir", saveFile = "myFile.RData")
#  plotPowerCont(outComputePower = "myFile",     # file with 'computePower' output
#                outDir = "~/myDir",             # path to myFile.RData
#                legendText = paste0("rho = ", c(1, 0.9, 0.7, 0.5)))

## ---- eval=FALSE---------------------------------------------------------
#  plotVElatCont(outComputePower = pwr)

## ---- eval=FALSE---------------------------------------------------------
#  computePower(..., saveDir = "myDir", saveFile = "myFile.RData")
#  plotVElatCont(outComputePower = "myFile",
#                outDir = "~/myDir")

## ---- eval=FALSE---------------------------------------------------------
#  pwr <- computePower(nCases = 32,
#                      nControls = 3654,
#                      nCasesWithS = 32,
#                      controlCaseRatio = 5,        # n^S_controls : n^S_cases ratio
#                      VEoverall = 0.75,            # overall VE
#                      risk0 = 0.034,               # placebo-group endpoint risk from tau - taumax
#                      PlatVElowest = 0.05,         # scalar; separate calls for 0.05, 0.1, 0.15, 0.2
#                      VElowest = seq(0, VEoverall, len=100), # lowest VE for true biomarker X*<=nu
#                      sigma2obs = 1,               # variance of observed biomarker S
#                      rho = 0.9                    # protection-relevant fraction of variance of S
#                      M = 1000,                    # number of simulated clinical trials
#                      alpha = 0.05,                # two-sided Wald test Type 1 error rate
#                      biomType = "continuous")     # "continuous" by default

## ---- eval=FALSE---------------------------------------------------------
#  plotPowerCont(outComputePower = list(pwr1, pwr2, pwr3, pwr4),          # output list from 'computePower'
#                legendText = paste0("PlatVElowest = ", c(0.05, 0.1, 0.15, 0.2)))

## ---- eval=FALSE---------------------------------------------------------
#  pwr <- computePower(nCases = 32,
#                      nControls = 3654,
#                      nCasesWithS = 32,
#                      cohort = TRUE,                # FALSE by default
#                      p = 0.01,                 # scalar; separate calls for 0.01, 0.02, 0.03, 0.05
#                      VEoverall = 0.75,             # overall VE
#                      risk0 = 0.034,                # placebo-group endpoint risk from tau - taumax
#                      VElat0 = seq(0, VEoverall, len=100), # grid of VE (V/P) among lower protected
#                      VElat1 = rep(VEoverall, 100), # grid of VE (V/P) among medium protected
#                      Plat0 = 0.2,                  # prevalence of lower protected
#                      Plat2 = 0.6,                  # prevalence of higher protected
#                      P0 = 0.2,                     # probability of low biomarker response
#                      P2 = 0.6,                     # probability of high biomarker response
#                      sens = 0.8, spec = 0.8, FP0 = 0, FN2 = 0,
#                      M = 1000,                     # number of simulated clinical trials
#                      alpha = 0.05,                 # two-sided Wald test Type 1 error rate
#                      biomType = "trichotomous")    # "continuous" by default

## ---- eval=FALSE---------------------------------------------------------
#  plotPowerTri(outComputePower = list(pwr1, pwr2, pwr3, pwr4),  # 'computePower' outputs
#               legendText = paste0("Cohort p = ", c(0.01, 0.02, 0.03, 0.05)))

## ---- eval=FALSE---------------------------------------------------------
#  pwr <- computePower(nCases = 32,
#                      nControls = 3654,
#                      nCasesWithS = 32,
#                      cohort = TRUE,               # FALSE by default
#                      p = 0.01,                    # scalar; separate calls for 0.01, 0.02, 0.03, 0.05
#                      VEoverall = 0.75,            # overall VE
#                      risk0 = 0.034,               # placebo-group endpoint risk from tau - taumax
#                      PlatVElowest = 0.2,          # prevalence of VE_lowest
#                      VElowest = seq(0, VEoverall, len=100), # lowest VE for true biomarker X*<=nu
#                      sigma2obs = 1,               # variance of observed biomarker S
#                      rho = 0.9                    # protection-relevant fraction of variance of S
#                      M = 1000,                    # number of simulated clinical trials
#                      alpha = 0.05,                # two-sided Wald test Type 1 error rate
#                      biomType = "continuous")     # "continuous" by default

## ---- eval=FALSE---------------------------------------------------------
#  plotPowerCont(outComputePower = list(pwr1, pwr2, pwr3, pwr4),  # 'computePower' outputs
#                legendText = paste0("Cohort p = ", c(0.01, 0.02, 0.03, 0.05)))

