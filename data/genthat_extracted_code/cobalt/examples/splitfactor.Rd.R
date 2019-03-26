library(cobalt)


### Name: splitfactor
### Title: Split and Unsplit Factors into Dummy Variables
### Aliases: splitfactor unsplitfactor

### ** Examples

data("lalonde", package = "cobalt")

lalonde.split <- splitfactor(lalonde, "race", 
                           replace = TRUE, 
                           drop.first = TRUE)
# A data set with "race_hispan" and "race_white" instead
# of "race".

lalonde.unsplit <- unsplitfactor(lalonde.split, "race", 
                        replace = TRUE,
                        dropped.level = "black")

all.equal(lalonde, lalonde.unsplit) #TRUE



