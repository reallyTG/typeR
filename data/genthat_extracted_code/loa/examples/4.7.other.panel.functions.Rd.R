library(loa)


### Name: 4.7.other.panel.functions
### Title: Other panel functions argument handlers
### Aliases: 4.7.other.panel.functions getArgs getPlotArgs isGood4LOA
###   parHandler
### Keywords: methods

### ** Examples


#getPlotArgs/isGood4LOA notes

#in formals
#my.plot <- function(..., user.reset = TRUE, ...) 

#in main code body
#local.resets <- [what developer wants] 
#plot.arg <- getPlotArgs("[type]", source, local.reset, user.reset)

#in panel call
#(for panel off/on control)
#if(isGood4LOA(plot.arg)) panel...(..., plot.arg,...)

#in panel... function
#for panel component off/on control)
#if(isGood4LOA(plot.arg1)) panel...(..., plot.arg1,...)
#if(isGood4LOA(plot.arg2)) l...(..., plot.arg2,...)
#etc.




