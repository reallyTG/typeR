library(ahp)


### Name: Analyze
### Title: Analyze your AHP model
### Aliases: Analyze AnalyzeTable PruneByCutoff PruneLevels

### ** Examples

ahpFile <- system.file("extdata", "car.ahp", package="ahp")
carAhp <- Load(ahpFile)
Calculate(carAhp)
Analyze(
   carAhp, 
   pruneFun = function(x, decisionMaker) {
     PruneLevels(x, decisionMaker, 1) && PruneByCutoff(x, decisionMaker, minWeight = 0.05)
   }
)
   
   
ahpFile <- system.file("extdata", "vacation.ahp", package="ahp")
vacationAhp <- Load(ahpFile)
Calculate(vacationAhp)
AnalyzeTable(
   vacationAhp,
   decisionMaker = "Kid",
   variable = "score",
   sort = "totalPriority"
)




