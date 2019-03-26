library(CluMP)


### Name: GeneratePanel
### Title: Generate an artificial Micro-Panel (longitudinal) Data
### Aliases: GeneratePanel
### Keywords: CluMP

### ** Examples

#Simple Linear model where each individual has 10 observations.
data <- GeneratePanel(n = 100, Param = ParamLinear, NbVisit = 10)

#Exponential model where each individual has 10 observations.
data <- GeneratePanel(100, ParamExpon, NbVisit = 10, VisitFreq = "Fixed", RegModel = "exponential")
PanelPlot(data)

#Cubic model where each individual has random number of observations on daily basis.
#Average number of observation is given by parameter NbVisit.
data <- GeneratePanel(n = 100, Param = ParamCubic, NbVisit = 100, RegModel = "cubic", units = "day")
PanelPlot(data)

#Quadratic model where each individual has random number of observations.
#Each object is observede weekly with variability 2 days.
data <- GeneratePanel(5,ParamQuadrat,NbVisit=50,RegModel="quadratic",units="week",TimeVar=2)
PanelPlot(data)

#Generate panel data with linear trend with 75% objects in first cluster and 25% in the second.
data <- GeneratePanel(n = 100, Param = ParamLinear, NbVisit = 10, ClusterProb = c(0.75, 0.25))
PanelPlot(data, color = "Cluster")



