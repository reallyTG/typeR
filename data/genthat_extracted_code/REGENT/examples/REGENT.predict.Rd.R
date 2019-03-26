library(REGENT)


### Name: REGENT.predict
### Title: REGENT.predict
### Aliases: REGENT.predict

### ** Examples


#Load example data from package

library(REGENT)

data("REGENT")

write.table(GeneticA,file="GeneticA.txt")
write.table(GeneticB,file="GeneticB.txt")
write.table(EnvironmentalA,file="EnvironmentalA.txt")
write.table(EnvironmentalB,file="EnvironmentalB.txt")
write.table(Inds,file="Inds.txt")

#Create model

x=REGENT.model(AnalysisName="Example",LocusFile="GeneticB.txt",EnvFile="EnvironmentalA.txt")

#Option 1, read model from object

y=REGENT.predict(AnalysisName="Example",model=x,ind="Inds.txt")

#Option 2, read model from file

y=REGENT.predict(AnalysisName="Example",model="Example.txt",ind="Inds.txt")




