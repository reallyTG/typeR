library(EcoTroph)


### Name: create.ETdiagnosis
### Title: ET-Diagnosis
### Aliases: create.ETdiagnosis
### Keywords: ~EcoTroph ~Diagnosis

### ** Examples

data(ecopath_guinee)
#Impacts of global changes in fishing efforts multipliers (in the range 0-5)
create.ETdiagnosis(create.ETmain(ecopath_guinee),same.mE=TRUE) 
#Test of all the combinations of fishing effort multipliers per fleet 
#(in the range 0-5)
## No test: 
create.ETdiagnosis(create.ETmain(ecopath_guinee))
## End(No test)
#With biomass input control
## No test: 
create.ETdiagnosis(create.ETmain(ecopath_guinee),B.Input=TRUE)
## End(No test)
#Impacts of changing fishing effort against Barracudas+ and Carangids groups
## No test: 
create.ETdiagnosis(create.ETmain(ecopath_guinee),
	Mul_eff=(seq(0,5,.1)),Group=c('Barracudas+','Carangids'))
	
## End(No test)



