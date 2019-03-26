library(LocalControl)


### Name: LocalControl
### Title: Local Control
### Aliases: LocalControl

### ** Examples

 # cross-sectional

 data(lindner)
 linVars <- c("stent", "height", "female", "diabetic", "acutemi",
              "ejecfrac", "ves1proc")
 csresults = LocalControl(data = lindner,
                          clusterVars = linVars,
                          treatmentColName = "abcix",
                          outcomeColName = "cardbill",
                          treatmentCode = 1)
 plot(csresults)


 # survival / competing risks example

 data(cardSim)
 crresults = LocalControl(data = cardSim, outcomeType = "survival",
                          outcomeColName = "status",
                          timeColName = "time",
                          treatmentColName = "drug",
                          treatmentCode = 1,
                          clusterVars = c("age", "bmi"))
 plot(crresults)



