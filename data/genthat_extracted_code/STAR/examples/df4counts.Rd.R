library(STAR)


### Name: df4counts
### Title: Generates a Data Frame from a repeatedTrain Object After Time
###   Binning
### Aliases: df4counts
### Keywords: ts

### ** Examples

## Not run: 
##D ## Load the Vanillin responses of the first
##D ## cockroach data set
##D data(CAL1V)
##D ## convert them into repeatedTrain objects
##D ## The stimulus command is on between 4.49 s and 4.99s
##D CAL1V <- lapply(CAL1V,as.repeatedTrain)
##D ## Generate raster plot for neuron 1
##D raster(CAL1V[["neuron 1"]],c(4.49,4.99))
##D ## make a smooth PSTH of these data
##D psth(CAL1V[["neuron 1"]],stimTimeCourse=c(4.49,4.99),breaks=c(bw=0.5,step=0.05),colCI=2,xlim=c(0,10))
##D ## add a grid to the plot
##D grid()
##D ## The response starts after 4.5 s and is mostly over after 6 s: create
##D ## breaks accordingly
##D myBreaks <- c(0,2.25,4.5,seq(4.75,6.25,0.25),seq(6.5,11,0.5))
##D ## get a count data frame
##D CAL1Vn1DF <- df4counts(CAL1V[["neuron 1"]],myBreaks)
##D ## use a box plot to look at the result
##D boxplot(Rate ~ Time, data=CAL1Vn1DF)
##D ## watch out here the time scale is distorted because of our
##D ## choice of unequal bins
##D ## Fit a glm of the Poisson family taking both Bin and Trial effects
##D CAL1Vn1DFglm <- glm(Count ~ Bin + Trial,family=poisson,data=CAL1Vn1DF)
##D ## use an anova to see that both the Bin effect and the trial effect are
##D ## highly significant
##D anova(CAL1Vn1DFglm, test="Chisq")
## End(Not run)


