library(MetabolicSurv)


### Name: MSData
### Title: Generate Artificial Metabolic Survival Data
### Aliases: MSData

### ** Examples

#GENERATE SOME METABOLIC SURVIVAL DATA WITH PROGNOSTIC FACTORS

Data<-MSData(nPatients=100,nMet=150,Prop=0.5)

SurvTime<-Data$Survival
Censor<-Data$Censor
ProgFact<-Data$Prognostic
MetData<-Data$Mdata
Metnames<-Data$Met.names



