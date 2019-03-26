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
#                              outpath="C:/out/",
#                              repetition=1,
#                              tickmetrics="true",
#                              idsetup="setup",
#                              idgo="go",
#                              idfinal=NA_character_,
#                              idrunnum=NA_character_,
#                              runtime=50,
#                              evalticks=seq(40,50),
#                              metrics=c("count sheep", "count wolves", "count patches with [pcolor = green]"),
#                              variables = list(),
#                              constants = list("initial-number-sheep" = 20,
#                                               "initial-number-wolves" = 20,
#                                               "model-version" = "\"sheep-wolves-grass\"",
#                                               "grass-regrowth-time" = 30,
#                                               "sheep-gain-from-food" = 4,
#                                               "wolf-gain-from-food" = 20,
#                                               "sheep-reproduce" = 4,
#                                               "wolf-reproduce" = 5,
#                                               "show-energy?" = "false"))
#  
#  nl@simdesign <- simdesign_simple(nl=nl,
#                                   nseeds=3)

## ----eval=FALSE----------------------------------------------------------
#  nl@experiment <- experiment(expname="wolf-sheep",
#                              outpath="C:/out/",
#                              repetition=1,
#                              tickmetrics="true",
#                              idsetup="setup",
#                              idgo="go",
#                              idfinal=NA_character_,
#                              idrunnum=NA_character_,
#                              runtime=50,
#                              evalticks=seq(40,50),
#                              metrics=c("count sheep", "count wolves", "count patches with [pcolor = green]"),
#                              variables = list('initial-number-sheep' = list(values=c(10, 20, 30, 40)),
#                                               'initial-number-wolves' = list(values=c(30, 40, 50, 60))),
#                              constants = list("model-version" = "\"sheep-wolves-grass\"",
#                                               "grass-regrowth-time" = 30,
#                                               "sheep-gain-from-food" = 4,
#                                               "wolf-gain-from-food" = 20,
#                                               "sheep-reproduce" = 4,
#                                               "wolf-reproduce" = 5,
#                                               "show-energy?" = "false"))
#  
#  nl@simdesign <- simdesign_distinct(nl=nl,
#                                     nseeds=3)

## ----eval=FALSE----------------------------------------------------------
#  nl@experiment <- experiment(expname="wolf-sheep",
#                              outpath="C:/out/",
#                              repetition=1,
#                              tickmetrics="true",
#                              idsetup="setup",
#                              idgo="go",
#                              idfinal=NA_character_,
#                              idrunnum=NA_character_,
#                              runtime=50,
#                              evalticks=seq(40,50),
#                              metrics=c("count sheep", "count wolves", "count patches with [pcolor = green]"),
#                              variables = list('initial-number-sheep' = list(values=c(10, 20, 30, 40)),
#                                               'initial-number-wolves' = list(min=0, max=50, step=10)),
#                              constants = list("model-version" = "\"sheep-wolves-grass\"",
#                                               "grass-regrowth-time" = 30,
#                                               "sheep-gain-from-food" = 4,
#                                               "wolf-gain-from-food" = 20,
#                                               "sheep-reproduce" = 4,
#                                               "wolf-reproduce" = 5,
#                                               "show-energy?" = "false"))
#  
#  nl@simdesign <- simdesign_ff(nl=nl,
#                               nseeds=3)

## ----eval=FALSE----------------------------------------------------------
#  nl@experiment <- experiment(expname="wolf-sheep",
#                              outpath="C:/out/",
#                              repetition=1,
#                              tickmetrics="true",
#                              idsetup="setup",
#                              idgo="go",
#                              idfinal=NA_character_,
#                              idrunnum=NA_character_,
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
#  
#  nl@simdesign <- simdesign_lhs(nl=nl,
#                                 samples=100,
#                                 nseeds=3,
#                                 precision=3)
#  

## ----eval=FALSE----------------------------------------------------------
#  nl@experiment <- experiment(expname="wolf-sheep",
#                              outpath="C:/out/",
#                              repetition=1,
#                              tickmetrics="true",
#                              idsetup="setup",
#                              idgo="go",
#                              idfinal=NA_character_,
#                              idrunnum=NA_character_,
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
#  
#  nl@simdesign <- simdesign_lhs(nl=nl,
#                                 samples=100,
#                                 nseeds=3,
#                                 precision=3)
#  
#  
#  nl@simdesign <- simdesign_sobol(nl=nl,
#                                   samples=200,
#                                   sobolorder=2,
#                                   sobolnboot=20,
#                                   sobolconf=0.95,
#                                   nseeds=3,
#                                   precision=3)
#  
#  nl@simdesign <- simdesign_sobol2007(nl=nl,
#                                       samples=200,
#                                       sobolnboot=20,
#                                       sobolconf=0.95,
#                                       nseeds=3,
#                                       precision=3)
#  
#  nl@simdesign <- simdesign_soboljansen(nl=nl,
#                                         samples=200,
#                                         sobolnboot=20,
#                                         sobolconf=0.95,
#                                         nseeds=3,
#                                         precision=3)
#  
#  
#  nl@simdesign <- simdesign_morris(nl=nl,
#                                    morristype="oat",
#                                    morrislevels=4,
#                                    morrisr=100,
#                                    morrisgridjump=2,
#                                    nseeds=3)
#  
#  nl@simdesign <- simdesign_eFast(nl=nl,
#                                   samples=100,
#                                   nseeds=3)

## ----eval=FALSE----------------------------------------------------------
#  nl@experiment <- experiment(expname="wolf-sheep",
#                              outpath="C:/out/",
#                              repetition=1,
#                              tickmetrics="true",
#                              idsetup="setup",
#                              idgo="go",
#                              idfinal=NA_character_,
#                              idrunnum=NA_character_,
#                              runtime=50,
#                              evalticks=seq(40,50),
#                              metrics=c("count sheep", "count wolves", "count patches with [pcolor = green]"),
#                              variables = list('initial-number-sheep' = list(min=50, max=150),
#                                               'initial-number-wolves' = list(min=50, max=150)),
#                              constants = list("model-version" = "\"sheep-wolves-grass\"",
#                                               "grass-regrowth-time" = 30,
#                                               "sheep-gain-from-food" = 4,
#                                               "wolf-gain-from-food" = 20,
#                                               "sheep-reproduce" = 4,
#                                               "wolf-reproduce" = 5,
#                                               "show-energy?" = "false"))
#  
#  nl@simdesign <- simdesign_GenAlg(nl=nl,
#                                   popSize = 200,
#                                   iters = 100,
#                                   evalcrit = 1,
#                                   elitism = NA,
#                                   mutationChance = NA,
#                                   nseeds = 1)
#  
#  nl@simdesign <- simdesign_GenSA(nl=nl,
#                                  par=NULL,
#                                  evalcrit=1,
#                                  control=list(max.time = 600),
#                                  nseeds=1)
#  

