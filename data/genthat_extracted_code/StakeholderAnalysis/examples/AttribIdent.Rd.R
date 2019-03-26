library(StakeholderAnalysis)


### Name: AttribIdent
### Title: AttribIdent
### Aliases: AttribIdent

### ** Examples

# first import DataExp
data(DataExp)
# then execute PrelCalc(), RespVerif()
PrelCalcExp=PrelCalc(data=DataExp, NoAtt=c(2,11,13,15),NoPow=c(3,8,14,16),
NoUrg=c(4,6,10,12),NoLeg=c(5,7,9,17),NoBen=18:22,NoCos=23:27)
RespVerifExp=RespVerif(CountResponses=PrelCalcExp$CountResponses,
NoStakeholders=PrelCalcExp$NoStakeholders)
# AttribIdent()
AttribIdentExp=AttribIdent(TestedResponses=RespVerifExp, NoAttrib=PrelCalcExp$NoAttrib,
NoStakeholders=PrelCalcExp$NoStakeholders, NameStakeholders=PrelCalcExp$NameStakeholders)
AttribIdentExp



