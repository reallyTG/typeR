library(StakeholderAnalysis)


### Name: ImpactAnalysis
### Title: ImpactAnalysis
### Aliases: ImpactAnalysis

### ** Examples

# first import DataExp
data(DataExp)
# then execute PrelCalc(), BenefCost()
PrelCalcExp=PrelCalc(data=DataExp, NoAtt=c(2,11,13,15),NoPow=c(3,8,14,16),
NoUrg=c(4,6,10,12),NoLeg=c(5,7,9,17),NoBen=18:22,NoCos=23:27)
BenefCostExp=BenefCost(CountResponses=PrelCalcExp$CountResponses)
# ImpactAnalysis()
ImpactAnalysisExp=ImpactAnalysis(data=DataExp, BenefCost=BenefCostExp$BenefCostInd,
NoStakeholders=PrelCalcExp$NoStakeholders, NameStakeholders=PrelCalcExp$NameStakeholders)
ImpactAnalysisExp



