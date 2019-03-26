library(EMbC)


### Name: lblp
### Title: labeling profile plot
### Aliases: lblp lblp,binClst,missing-method
###   lblp,binClstStck,missing-method lblp,binClst,numeric-method
###   lblp,binClst,binClst-method

### ** Examples

# -- apply EMbC to the example path --
mybcp <- stbc(expth)
# -- plot the labeling profile comparing with expert labeling --
lblp(mybcp,expth$lbl)
# -- compare original and smoothed labeling profiles --
lblp(mybcp,smth(mybcp))



