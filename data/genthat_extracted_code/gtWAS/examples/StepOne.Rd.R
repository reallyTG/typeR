library(gtWAS)


### Name: StepOne
### Title: Compute minimum p value and information criteria statistics in
###   one step
### Aliases: StepOne
### Keywords: Model Selection

### ** Examples

data(Tdata)
data(alldata)
TMdata <- cbind(Tdata,alldata[,1:100])
findIn = FALSE
independent = "B"
varIn <- rep(0,100)
StepOne(findIn,independent,criteria="SBC",varIn,TMdata,sigma=0)



