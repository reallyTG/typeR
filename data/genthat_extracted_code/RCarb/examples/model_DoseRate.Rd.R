library(RCarb)


### Name: model_DoseRate
### Title: Model dose rate evolution in carbonate-rich samples
### Aliases: model_DoseRate
### Keywords: dplot manip

### ** Examples

##load example data
data("Example_Data", envir = environment())

##run the function for one sample from
##the dataset
model_DoseRate(
data = Example_Data[14,],
n.MC = 2,
txtProgressBar = FALSE
)





