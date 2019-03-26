library(LBSPR)


### Name: plotSim
### Title: General plotting function for simulated data
### Aliases: plotSim

### ** Examples

 LB_pars <- new("LB_pars")
 LB_pars@MK <- 1.5
 LB_pars@Linf <- 100
 LB_pars@L50 <- 50
 LB_pars@L95 <- 55
 LB_pars@SL50 <- 60
 LB_pars@SL95 <- 65
 LB_pars@FM <- 1
 Sim <- LBSPRsim(LB_pars)
 plotSim(Sim)




