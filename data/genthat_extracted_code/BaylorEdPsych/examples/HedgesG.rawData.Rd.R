library(BaylorEdPsych)


### Name: HedgesG.rawData
### Title: Hedges' g from raw data
### Aliases: HedgesG.rawData
### Keywords: Effect Size Hedges' g

### ** Examples

#Simulate Data
set.seed(4565)
Treat<-rnorm(100,.5,1)
set.seed(45651)
Control<-rnorm(100,0,1)

HedgesG.rawData(Treat,Control)



