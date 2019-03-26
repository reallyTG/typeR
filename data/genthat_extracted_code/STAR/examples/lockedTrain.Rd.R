library(STAR)


### Name: lockedTrain
### Title: Construct and Plot Time-Dependent Cross-correlation Diagram
### Aliases: lockedTrain plot.lockedTrain print.lockedTrain
### Keywords: ts survival

### ** Examples

## Not run: 
##D ## load spontaneous data of 4 putative projection neurons
##D ## simultaneously recorded from the cockroach (Periplaneta
##D ## americana) antennal lobe
##D data(CAL1S)
##D ## convert data into spikeTrain objects
##D CAL1S <- lapply(CAL1S,as.spikeTrain)
##D ## look at the individual trains
##D ## first the "raw" data
##D CAL1S[["neuron 1"]]
##D ## contruct the lockedTrain of each neuron with itself and look at
##D ## it using a lag of +/- 25 ms
##D lockedTrain(CAL1S[["neuron 1"]],laglim=c(-1,1)*0.025)
##D lockedTrain(CAL1S[["neuron 2"]],laglim=c(-1,1)*0.025)
##D lockedTrain(CAL1S[["neuron 3"]],laglim=c(-1,1)*0.025)
##D lockedTrain(CAL1S[["neuron 4"]],laglim=c(-1,1)*0.025)
##D 
##D ## Look at the Vanillin responses
##D ## Get the data
##D data(CAL1V)
##D ## convert them into repeatedTrain objects
##D ## The stimulus command is on between 4.49 s and 4.99s
##D CAL1V <- lapply(CAL1V,as.repeatedTrain)
##D ## look at the individual raster plots
##D plot(CAL1V[["neuron 1"]],stimTimeCourse=c(4.49,4.99),main="N1")
##D plot(CAL1V[["neuron 2"]],stimTimeCourse=c(4.49,4.99),main="N2")
##D plot(CAL1V[["neuron 3"]],stimTimeCourse=c(4.49,4.99),main="N3")
##D plot(CAL1V[["neuron 4"]],stimTimeCourse=c(4.49,4.99),main="N4")
##D ## construct the locked train for the 3 pairs with neuron 1 as a
##D ## reference
##D plot(lockedTrain(CAL1V[["neuron 1"]],CAL1V[["neuron 3"]],
##D      laglim=0.01*c(-1,1)),stimTimeCourse=c(4.49,4.99),pch="*")
##D plot(lockedTrain(CAL1V[["neuron 1"]],CAL1V[["neuron 2"]],
##D      laglim=0.01*c(-1,1)),stimTimeCourse=c(4.49,4.99),pch="*")
##D plot(lockedTrain(CAL1V[["neuron 1"]],CAL1V[["neuron 4"]],
##D      laglim=0.01*c(-1,1)),stimTimeCourse=c(4.49,4.99),pch="*")
## End(Not run)



