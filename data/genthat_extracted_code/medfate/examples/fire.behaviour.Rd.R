library(medfate)


### Name: fire.behaviour
### Title: Fire behaviour functions
### Aliases: fire.Rothermel fire.FCCS

### ** Examples

#Load example plot plant data
data(exampleforest)

#Default species parameterization
data(SpParamsMED)

#Calculate fuel properties according to FCCS
fccs = fuel.FCCS(exampleforest, 50,100, SpParamsMED)

#Calculate fire behavior according to FCCS
fire.FCCS(fccs)

#Load fuel model parameter data
data(SFM_metric)

#Fuel stratification (returns heights in cm)
fs = fuel.Stratification(exampleforest, SpParamsMED)

#Correct windspeed (transform heights to m)
u = 11 #m/s
umf = u*fuel.WindAdjustmentFactor(fs$surfaceLayerTopHeight/100, fs$canopyBaseHeight/100, 
                                  fs$canopyTopHeight/100, 60)

#Call Rothermel function using fuel model 'A6'
fire.Rothermel(modeltype="D", wSI = as.numeric(SFM_metric["A6",2:6]), 
                    sSI = as.numeric(SFM_metric["A6",7:11]), 
                    delta = as.numeric(SFM_metric["A6",12]),
                    mx_dead = as.numeric(SFM_metric["A6",13]),
                    hSI = as.numeric(SFM_metric["A6",14:18]),
                    mSI = c(10,10,10,30,60),
                    u=umf, windDir=0, slope=0, aspect=0)



