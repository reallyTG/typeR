library(deltaPlotR)


### Name: adjustExtreme
### Title: Adjusting the proportions of correct responses for extreme cases
### Aliases: adjustExtreme

### ** Examples


 # Loading of the verbal data
 data(verbal)
 attach(verbal)

 # Excluding the "Anger" variable
 verbal <- verbal[colnames(verbal)!="Anger"]

 # Computing the proportions of correct answers per group
 prop <- matrix(NA, 24, 2)
 for (i in 1:24){
  prop[i,1] <- mean(verbal[verbal[,25]==0,i], na.rm=TRUE)
  prop[i,2] <- mean(verbal[verbal[,25]==1,i], na.rm=TRUE)
 }

 # "constraint" method
 adjustExtreme(data=verbal[,1:24], group=verbal[,25], focal.name=1, prop=prop)

 # "constraint" method with differently specified range
 adjustExtreme(data=verbal[,1:24], group=verbal[,25], focal.name=1, prop=prop,
  const.range=c(0.01,0.99))

 # "add" method
 adjustExtreme(data=verbal[,1:24], group=verbal[,25], focal.name=1, prop=prop,
  method="add")

 # "add" method with different number of successes added
 adjustExtreme(data=verbal[,1:24], group=verbal[,25], focal.name=1, prop=prop,
  method="add", nrAdd=2)

 # "constraint" method because of lack of provided data
 adjustExtreme(prop=prop)



