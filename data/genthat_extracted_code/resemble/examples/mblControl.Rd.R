library(resemble)


### Name: mblControl
### Title: A function that controls some aspects of the memory-based
###   learning process in the 'mbl' function
### Aliases: mblControl

### ** Examples

#A control list with the default parameters
mblControl()

#A control list which specifies the moving correlation 
#dissimilarity metric with a moving window of 30
mblControl(sm = "movcor", ws = 31)



