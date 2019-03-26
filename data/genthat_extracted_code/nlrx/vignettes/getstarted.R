## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  library(nlrx)
#  # Windows default NetLogo installation path (adjust to your needs!):
#  netlogopath <- file.path("C:/Program Files/NetLogo 6.0.3")
#  modelpath <- file.path(netlogopath, "app/models/Sample Models/Biology/Wolf Sheep Predation.nlogo")
#  outpath <- file.path("C:/out")
#  # Unix default NetLogo installation path (adjust to your needs!):
#  netlogopath <- file.path("/home/NetLogo 6.0.3")
#  modelpath <- file.path(netlogopath, "app/models/Sample Models/Biology/Wolf Sheep Predation.nlogo")
#  outpath <- file.path("/home/out")
#  
#  nl <- nl(nlversion = "6.0.3",
#           nlpath = netlogopath,
#           modelpath = modelpath,
#           jvmmem = 1024)

## ----eval=FALSE----------------------------------------------------------
#  nl@experiment <- experiment(expname="wolf-sheep",
#                              outpath=outpath,
#                              repetition=1,
#                              tickmetrics="true",
#                              idsetup="setup",
#                              idgo="go",
#                              runtime=50,
#                              evalticks=seq(40,50),
#                              metrics=c("count sheep", "count wolves", "count patches with [pcolor = green]"),
#                              variables = list('initial-number-sheep' = list(min=50, max=150, qfun="qunif"),
#                                               'initial-number-wolves' = list(min=50, max=150, qfun="qunif")),
#                              constants = list("model-version" = "\"sheep-wolves-grass\"",
#                                               "grass-regrowth-time" = 30,
#                                               "sheep-gain-from-food" = 4,
#                                               "wolf-gain-from-food" = 20,
#                                               "sheep-reproduce" = 4,
#                                               "wolf-reproduce" = 5,
#                                               "show-energy?" = "false"))

## ----eval=FALSE----------------------------------------------------------
#  nl@simdesign <- simdesign_lhs(nl=nl,
#                                 samples=100,
#                                 nseeds=3,
#                                 precision=3)

## ----eval=FALSE----------------------------------------------------------
#  results <- run_nl_all(nl)

## ----eval=FALSE----------------------------------------------------------
#  # Attach results to nl object:
#  setsim(nl, "simoutput") <- results
#  
#  # Write output to outpath of experiment within nl
#  write_simoutput(nl)
#  
#  # Do further analysis:
#  analyze_nl(nl)

