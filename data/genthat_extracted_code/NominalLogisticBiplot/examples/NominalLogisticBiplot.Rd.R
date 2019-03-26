library(NominalLogisticBiplot)


### Name: NominalLogisticBiplot
### Title: Nominal Logistic Biplot for polytomous data
### Aliases: NominalLogisticBiplot
### Keywords: biplot logistic models

### ** Examples


data(HairColor)
nlbo = NominalLogisticBiplot(HairColor,sFormula=NULL,
numFactors=2,method="EM",penalization=0.2,show=FALSE)
nlbo

#data(PhD_nomCyL)
#cyl = NominalLogisticBiplot(PhD_nomCyL,sFormula=NULL,
#numFactors=2,method="EM",initial = 1,penalization=0.3,show=FALSE)
#summary(nlboPhD)
#plot(nlboPhD,QuitNotPredicted=TRUE,ReestimateInFocusPlane=TRUE,
#      planex = 1,planey = 2,proofMode=TRUE,LabelInd=FALSE,AtLeastR2 = 0.01,
#      xlimi=-1.5,xlimu=1.5,ylimi=-1.5,ylimu=1.5,linesVoronoi = TRUE,SmartLabels = FALSE,
#      PlotInd=TRUE,
#      CexInd = c(0.4),                                                           
#      PchInd = c(1),
#      ColorInd="azure3",
#      PlotVars=TRUE,LabelVar = TRUE,
#      PchVar = c(1,2,3,4,5,6,7,8,9),ColorVar = c("red","black","maroon","blue","green",
#      "chocolate4","coral3","brown","brown2"),
#      ShowResults=TRUE)





