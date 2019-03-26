library(ahp)


### Name: ahp
### Title: ahp AHP (Analytic Hierarchy Process) Modeling for R
### Aliases: ahp ahp-package

### ** Examples

library(ahp)
#list example files provided by the package
list.files(system.file("extdata", package="ahp"))
#load a specific example
ahpFile <- system.file("extdata", "car.ahp", package="ahp")
carAhp <- Load(ahpFile)
Calculate(carAhp)
Analyze(carAhp)
AnalyzeTable(carAhp)

#the vacation.ahp file provides an example with multiple decision makers
ahpFile <- system.file("extdata", "vacation.ahp", package="ahp")
vacationAhp <- Load(ahpFile)
Calculate(vacationAhp)
Visualize(vacationAhp)
Analyze(vacationAhp, decisionMaker = "Dad")
AnalyzeTable(vacationAhp, decisionMaker = "Mom")
AnalyzeTable(vacationAhp, 
             decisionMaker = "Kid",
             variable = "priority", 
             sort = "orig", 
             pruneFun = function(node, dm) PruneByCutoff(node, dm, minWeight = 0.1))




