library(phase1PRMD)


### Name: SimPRMD
### Title: Simulation for a Multi-Stage Phase I Dose-Finding Design
### Aliases: SimPRMD

### ** Examples

data("prob")      # load prob.RData from package phaseI, Details see "?prob"
data("eff")       # load eff.RData from package phaseI. Details see "?eff"

eff.structure = eff$Dose_Cycle_Meff[2, 2, , ]
eff.Sigma = eff$Sigma
eff.sd_trans = eff$sd_trans

wm <- matrix(c(0, 0.5, 0.75, 1, 1.5,
               0, 0.5, 0.75, 1, 1.5,
               0, 0, 0, 0.5, 1),
             byrow = TRUE, ncol
              = 5)                          # weighted matrix for toxicity matrix
                                            # nrow = No.of type; ncol = No. of grade
toxmax <- 2.5
tox.matrix <- prob["MTD4", "flat", , , , ]


#------- a flat dose-toxicity, dose-efficacy, cycle-efficacy pattern------#
## No test: 
simul1 <- SimPRMD(numTrials = 1, tox.matrix = tox.matrix,
                  eff.structure = eff.structure, eff.Sigma = eff.Sigma,
                  eff.sd_trans = eff.sd_trans, wm = wm, toxmax = toxmax,
                  trialSize = 36)
## End(No test)
#------- a flat dose-toxicity pattern model ------#
## No test: 
simul2 <- SimPRMD(numTrials = 1, toxtype = c("H", "L", "M"),
                  intercept.alpha = c(1.9, 2.3, 2.6, 3.1),
                  coef.beta = c(-0.3, -0.2, -0.25),
                  cycle.gamma = 0, tox.target = 0.23,
                  thrd1 = 0.23, thrd2 = 0.23, p_tox1 = 0.2, p_tox2 = 0.2,
                  ICD.flag = FALSE, IED.flag = FALSE, effcy.flag = TRUE)

summary(simul2)
plot(simul2)
## End(No test)




