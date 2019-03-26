library(NominalLogisticBiplot)


### Name: plotNominalFittedVariable
### Title: Function for plotting in the reduced space an unordered and
###   fitted categorical variable.
### Aliases: plotNominalFittedVariable
### Keywords: nominal fitting plot

### ** Examples

data(Env)
nlbo = NominalLogisticBiplot(Env,sFormula=NULL,
numFactors=2,method="EM",penalization=0.2,show=FALSE)
nameVar = nlbo$dataSet$ColumNames[1]
numcateg = 4
beta = nlbo$VariableModels[,1]$beta
Nagelkerke = nlbo$VariableModels[,1]$Nagelkerke 
varstudyC = as.matrix(as.numeric(Env[,1]))
rowCoords = nlbo$RowsCoords
levelsVar = c("M1","M2","M4","M5")
plotNominalFittedVariable(nameVar,numcateg,beta,varstudyC,rowCoords,levelsVar=NULL,
            numFactors=2,planex = 1,planey = 2,xi=-3.5,xu=3.5,yi=-3.5,yu=3.5,
            CexVar=0.7,ColorVar="blue",PchVar=0.7,addToPlot=FALSE,
            QuitNotPredicted=TRUE,ShowResults=TRUE,linesVoronoi=TRUE,LabelVar=TRUE)




