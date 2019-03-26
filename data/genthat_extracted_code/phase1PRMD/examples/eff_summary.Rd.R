library(phase1PRMD)


### Name: eff_summary
### Title: Compute the summary statistics of efficacy measure with
###   specified parameters.
### Aliases: eff_summary

### ** Examples

data("eff")       # load eff.RData from package phase1PRMD. Details see "?eff"
eff.structure = eff$Dose_Cycle_Meff["plat", "dec", , ]
eff.Sigma = eff$Sigma
eff.sd_trans = eff$sd_trans

# res <- eff_summary(eff.structure, eff.Sigma, eff.sd_trans, n.sim = 300000,
#                    seed = 123)
# res
# set a special cases and check the density and correlation plots
# eff_summary(eff.structure = matrix(eff.structure[cbind(c(1:6), c(1:6))],
#                                   nrow = 1, ncol = 6),
#             eff.Sigma, eff.sd_trans, n.sim = 300000, seed = 123,
#             plot.flag = TRUE, plot.title = FALSE)




