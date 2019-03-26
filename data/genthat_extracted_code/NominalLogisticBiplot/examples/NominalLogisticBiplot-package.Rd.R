library(NominalLogisticBiplot)


### Name: NominalLogisticBiplot-package
### Title: Nominal Logistic Biplot representations for polytomous data
### Aliases: NominalLogisticBiplot-package
### Keywords: package

### ** Examples

data(HairColor)
nlbo = NominalLogisticBiplot(HairColor,sFormula=NULL,numFactors=2,
method="EM",penalization=0.2,show=FALSE)
summary(nlbo)
plot(nlbo,QuitNotPredicted=TRUE,ReestimateInFocusPlane=TRUE,
planex = 1,planey = 2,proofMode=TRUE,LabelInd=TRUE,AtLeastR2 = 0.01
,xlimi=-1.5,xlimu=1.5,ylimi=-1.5,ylimu=1.5,linesVoronoi = TRUE
,SmartLabels = FALSE, PlotInd=TRUE,CexInd = c(0.6,0.7,0.5,0.4,0.5,0.6,0.7)
,PchInd = c(1,2,3,4,5,6,7),ColorInd="black",PlotVars=TRUE,LabelVar = TRUE
,PchVar = c(1,2,3,4,5),ColorVar = c("red","black","yellow","blue","green")
,ShowResults=TRUE)




