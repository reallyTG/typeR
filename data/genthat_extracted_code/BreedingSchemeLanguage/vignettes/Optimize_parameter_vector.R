## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----loadBSL, message=FALSE----------------------------------------------
library(BreedingSchemeLanguage)

## ----objective Function--------------------------------------------------
objFunc <- function(sEnv){
  cross(sEnv, nProgeny=200) # popID 4
  scheme_out <- outputResults(sEnv)
  return(mean(scheme_out[nrow(scheme_out), 1:length(sEnv$sims)]))
}

## ----find script and set up----------------------------------------------
fileFounderData <- system.file("extdata", "optimizationSchemeData.RData", package = "BreedingSchemeLanguage")
# Take ".RData" off because it gets added
fileFounderData <- substr(fileFounderData, 1, nchar(fileFounderData)-6)
schemeScriptPath <- system.file("extdata", "optimizationScheme.R", package = "BreedingSchemeLanguage")
allowableBudget <- 1000
bestObjective <- -1e6
bestParms <- NULL
allParms <- NULL

## ----display scheme, echo=FALSE, include=TRUE----------------------------
scheme <- readLines(con=schemeScriptPath)
# for (i in 1:10) cat(scheme[i], "\n")

## ----function to sample parmList-----------------------------------------
sampleParmList <- function(){
  return(list(nRepC0=sample(2, 1), nRepC1=sample(2, 1), nFounder=sample(350, 1) + 50, nProg=sample(350, 1) + 50, yesGeno=runif(1) < 0.5))
}

## ----Sample nIter possible parameter vectors-----------------------------
nIter <- 10
for (i in 1:nIter){
  # Set up a fresh simulation
  if (exists("simEnv")){
    rm(list=names(simEnv), envir=simEnv)
    rm(simEnv)
  }
  simEnv <- defineSpecies(loadData=fileFounderData)
  defineVariances(plotTypeErrVars = c(Standard = 2))
  defineCosts(phenoCost = c(Standard = 1), genoCost = 0.25)
  
  parmList <- sampleParmList()
  # Get objective value for the scheme
  schemeOut <- testParameterOptimality(schemeFileName = schemeScriptPath, parmList=parmList, objectiveFunc=objFunc, budget=allowableBudget)
  
  # If over budget, adjust number of progeny, nProg, to keep within budget
  if (is.na(schemeOut$objective)){
    adjust <- allowableBudget / schemeOut$totalCost
    parmList$nFounder <- floor(parmList$nFounder * adjust)
    parmList$nProg <- floor(parmList$nProg * adjust)
    if (exists("simEnv")){
      rm(list=names(simEnv), envir=simEnv)
      rm(simEnv)
    }
    simEnv <- defineSpecies(loadData=fileFounderData)
    defineVariances(plotTypeErrVars = c(Standard = 2))
    defineCosts(phenoCost = c(Standard = 1), genoCost = 0.25)
    schemeOut <- testParameterOptimality(schemeFileName = schemeScriptPath, parmList=parmList, objectiveFunc=objFunc, budget=allowableBudget)
    if (is.na(schemeOut$objective)) stop("Budget allocation problem")
  }
  
  # If objective better than anything before, save the parmList
  if (schemeOut$objective > bestObjective){
    bestObjective <- schemeOut$objective
    bestParms <- parmList
  }
  allParms <- rbind(allParms, c(i, unlist(parmList), unlist(schemeOut)))
}

## ----print the objective and parameters----------------------------------
print(paste("Best Reponse", bestObjective))
print("Parameter List")
print(parmList)
print(head(allParms[order(allParms[,"objective"], decreasing=T),]))

