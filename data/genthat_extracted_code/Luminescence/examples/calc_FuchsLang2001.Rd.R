library(Luminescence)


### Name: calc_FuchsLang2001
### Title: Apply the model after Fuchs & Lang (2001) to a given De
###   distribution.
### Aliases: calc_FuchsLang2001
### Keywords: dplot

### ** Examples

## load example data
data(ExampleData.DeValues, envir = environment())

## calculate De according to Fuchs & Lang (2001)
temp<- calc_FuchsLang2001(ExampleData.DeValues$BT998, cvThreshold = 5)




