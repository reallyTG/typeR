library(kwb.hantush)


### Name: confDistances_ex1
### Title: USGS verification example: model parameterisation (multiple
###   distances)
### Aliases: confDistances_ex1

### ** Examples

res <- confDistances_ex1()
if(FALSE){
#### Head for each time step (defined with parameter "numberTimeSteps)
xyplot(head ~ x | as.factor(sprintf("%f days", timeSteps)),
       data=res$timeSteps,
       type="b",
       las=1,
       as.table=TRUE)
#### Head at end of simulation
plot(head ~ x,
     data=res$simTime,
     type="b",
     las=1)
}
#### Water level increase at end of simulation & compare to alternative models
modelComparison <- compareModelResults(conf = res)
plotModelComparison(modelComparison = modelComparison)



