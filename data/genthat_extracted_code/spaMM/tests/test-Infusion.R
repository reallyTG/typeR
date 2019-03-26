cat("\ntest of Infusion compatibility:")

if (requireNamespace("Infusion",quietly=TRUE)) {
  Infusion::Infusion.options(spaMM.options("example_maxtime"))
  #Infusion.options(example_maxtime=20)  ## allows basic example
  #Infusion.options(example_maxtime=120)  ## allows refine()
  example("example_raw",package="Infusion",ask=FALSE) ## detected calc_logdisp_cov issues   
}

