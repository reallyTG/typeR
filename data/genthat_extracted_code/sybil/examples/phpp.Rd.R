library(sybil)


### Name: phpp
### Title: Phenotypic Phase Plane Analysis
### Aliases: phpp
### Keywords: optimize

### ** Examples

  data(Ec_core)
  
  # switch off glucose input
  Ec_core_wo_glc <- changeUptake(Ec_core, off = "glc_D[e]")
  opt <- phpp(Ec_core_wo_glc, ctrlreact = c("EX_succ(e)", "EX_o2(e)"))
  
  # plot phenotypic phase plane
  plot(opt)
  
  # plot reduced costs of the two control reactions
  plot(opt, "EX_succ(e)")
  plot(opt, "EX_o2(e)")



