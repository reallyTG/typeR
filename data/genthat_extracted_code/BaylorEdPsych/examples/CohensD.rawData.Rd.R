library(BaylorEdPsych)


### Name: CohensD.rawData
### Title: Calculate's Cohen's d
### Aliases: CohensD.rawData
### Keywords: Effect Size Cohen's d

### ** Examples

#Simulate Data
set.seed(4565)
Treat<-rnorm(100,.5,1)
set.seed(45651)
Control<-rnorm(100,0,1)

CohensD.rawData(Treat,Control)



