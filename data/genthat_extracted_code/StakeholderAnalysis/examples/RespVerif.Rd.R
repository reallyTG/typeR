library(StakeholderAnalysis)


### Name: RespVerif
### Title: RespVefif
### Aliases: RespVerif

### ** Examples

# first import DataExp
data(DataExp)
# then execute PrelCalc()
PrelCalcExp=PrelCalc(data=DataExp, NoAtt=c(2,11,13,15),NoPow=c(3,8,14,16),
NoUrg=c(4,6,10,12),NoLeg=c(5,7,9,17),NoBen=18:22,NoCos=23:27)
# RespVerif
RespVerifExp=RespVerif(CountResponses=PrelCalcExp$CountResponses,
NoStakeholders=PrelCalcExp$NoStakeholders)
RespVerifExp



