library(PBSmapping)


### Name: summary
### Title: Summarize PBS Mapping Objects
### Aliases: summary.EventData summary.LocationSet summary.PolyData
###   summary.PolySet
### Keywords: methods

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
    data(surveyData,envir=.PBSmapEnv)
  print(summary(surveyData))
})



