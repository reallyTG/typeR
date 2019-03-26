library(NominalLogisticBiplot)


### Name: plotNominalVariable
### Title: Function for plotting in the reduced space an unordered
###   categorical variable.
### Aliases: plotNominalVariable
### Keywords: nominal plot

### ** Examples

data(HairColor)
nlbo = NominalLogisticBiplot(HairColor,sFormula=NULL,
numFactors=2,method="EM",penalization=0.2,show=FALSE)
nameVar = nlbo$dataSet$ColumNames[2]
nominalVar = HairColor[,2]
estimRows = nlbo$RowsCoords 
plotNominalVariable(nameVar,nominalVar,estimRows,planex = 1,planey = 2,
    xi=-1.5,xu=1.5,yi=-1.5,yu=1.5,CexVar=0.7,ColorVar="blue",PchVar=0.7,
    addToPlot=FALSE,QuitNotPredicted=TRUE,ShowResults=TRUE,
    linesVoronoi=TRUE,LabelVar=TRUE,tol = 1e-04, maxiter = 100,
    penalization = 0.3,showIter = FALSE)




