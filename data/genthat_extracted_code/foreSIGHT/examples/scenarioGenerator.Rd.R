library(foreSIGHT)


### Name: scenarioGenerator
### Title: Scenario Generator
### Aliases: scenarioGenerator
### Keywords: functions

### ** Examples

library(foreSIGHT)                 ###Load package

data(tankDat)                         ###Load tank data

###Scenario generation arguments
modelTag="Simple-ann"
attPerturb<-c("P_ann_tot_m","Temp_ann_avg_m")
exSpArgs<-list(type = "regGrid",
               samp = c(7,6),
               bounds = list("P_ann_tot_m"=c(0.9,1.5),
                             "Temp_ann_avg_m"=c(-1,4)))

###Function call
out<-scenarioGenerator(obs=tank_obs,
                  modelTag = modelTag,
                  attPerturb=attPerturb,
                  exSpArgs = exSpArgs,
                  simDirectory="Simulation1")





