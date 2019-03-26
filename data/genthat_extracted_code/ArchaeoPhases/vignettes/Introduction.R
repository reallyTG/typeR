## ---- echo = FALSE, message = FALSE-----------------------------------------------------------------------------------
knitr::opts_chunk$set(comment = "")
options(width = 120, max.print = 5)
library(ArchaeoPhases)

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  install.packages('ArchaeoPhases')

## ---------------------------------------------------------------------------------------------------------------------
library(ArchaeoPhases)

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  app_ArchaeoPhases()

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  data_MCMC = ImportCSV()

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  ChronoModel_MCMC = ImportCSV("pathToFiles/events.csv", iterationColumn = 1)

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  ChronoModel_MCMC_Groups = ImportCSV("pathToFiles/phases.csv", iterationColumn = 1)

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  Oxcal_MCMC = ImportCSV("pathToFiles/fileName.csv", iterationColumn = 1)

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  data("KADatesOxcal")
#  Oxcal_MCMC_Groups = CreateMinMaxGroup(KADatesOxcal, position = 4, name = "IUP")
#  Oxcal_MCMC_Groups = CreateMinMaxGroup(KADatesOxcal, position = c(7:13,15:18), name = "Ahmarian", add=Oxcal_MCMC_Groups)
#  Oxcal_MCMC_Groups = CreateMinMaxGroup(KADatesOxcal, position = c(21:23), name = "UP", add=Oxcal_MCMC_Groups)
#  Oxcal_MCMC_Groups = CreateMinMaxGroup(KADatesOxcal, position = 26, name = "EPI", add=Oxcal_MCMC_Groups, exportFile = "Oxcal_MCMC_Groups.csv")

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  BCal_MCMC = ImportCSV("pathToFiles/fileName.csv", iterationColumn = 1, referenceYear = 1950, rowToWithdraw = "last", bin.width=1)
#  # equivalent to
#  BCal_MCMC = ImportCSV.BCal("pathToFiles/fileName.csv", bin.width=1)

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  data("Fishpond")
#  BCal_MCMC_Groups = CreateMinMaxGroup(Fishpond, position = c(3:6), name = "Layer.II")
#  BCal_MCMC_Groups = CreateMinMaxGroup(Fishpond, position = 9, name = "Layer.III", add=BCal_MCMC_Groups, exportFile = "BCal_MCMC_Groups.csv")

## ----fig.align='center',fig.width=6,fig.height=5----------------------------------------------------------------------
data("KADatesChronoModel")
mcmcList = coda.mcmc(KADatesChronoModel, numberChains = 3, iterationColumn = 1)
autocorr.plot(mcmcList[,1,])

## ----fig.align='center',fig.width=6,fig.height=5----------------------------------------------------------------------
plot(mcmcList[,1,])

## ----fig.align='center',fig.width=6,fig.height=5----------------------------------------------------------------------
gelman.diag(mcmcList)
gelman.plot(mcmcList[,1,])

## ----fig.align='center',fig.width=6,fig.height=5----------------------------------------------------------------------
geweke.diag(mcmcList[,1,], frac1=0.1, frac2=0.5)

