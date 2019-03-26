library(StakeholderAnalysis)


### Name: RelationPict
### Title: RelationPict
### Aliases: RelationPict

### ** Examples

# first import DataExp
data(DataExp)
# then execute PrelCalc(), RespVerif(), AttribIdent(), CollabPotential()
# BenefCost(), StakeholdClassif(), ImpactAnalysis()
PrelCalcExp=PrelCalc(data=DataExp, NoAtt=c(2,11,13,15),NoPow=c(3,8,14,16),
NoUrg=c(4,6,10,12),NoLeg=c(5,7,9,17),NoBen=18:22,NoCos=23:27)
RespVerifExp=RespVerif(CountResponses=PrelCalcExp$CountResponses,
NoStakeholders=PrelCalcExp$NoStakeholders)
AttribIdentExp=AttribIdent(TestedResponses=RespVerifExp,
NoAttrib=PrelCalcExp$NoAttrib, NoStakeholders=PrelCalcExp$NoStakeholders,
NameStakeholders=PrelCalcExp$NameStakeholders)
CollabPotentialExp=CollabPotential(AttribIdent=AttribIdentExp)
BenefCostExp=BenefCost(CountResponses=PrelCalcExp$CountResponses)
StakeholdClassifByMean=StakeholdClassif(BenefCostTest=BenefCostExp$BenefCostTest,
CollabPotential=CollabPotentialExp$Mean,AttribIdent=AttribIdentExp$Mean)
ImpactAnalysisExp=ImpactAnalysis(data=DataExp, BenefCost=BenefCostExp$BenefCostInd,
NoStakeholders=PrelCalcExp$NoStakeholders,
NameStakeholders=PrelCalcExp$NameStakeholders)
# RelationPict()
RelationPict(path="",tofile=0,MeanImpact=ImpactAnalysisExp$MeanImpact,
StakeholdClassif=StakeholdClassifByMean)



