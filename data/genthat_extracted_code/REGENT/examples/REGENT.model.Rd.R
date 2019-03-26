library(REGENT)


### Name: REGENT.model
### Title: REGENT.model
### Aliases: REGENT.model

### ** Examples


library(REGENT)

#Load example data from package

data("REGENT")

write.table(GeneticA,file="GeneticA.txt")
write.table(GeneticB,file="GeneticB.txt")
write.table(EnvironmentalA,file="EnvironmentalA.txt")
write.table(EnvironmentalB,file="EnvironmentalB.txt")

x=REGENT.model(AnalysisName="Example",LocusFile="GeneticA.txt",EnvFile="EnvironmentalA.txt")

x




