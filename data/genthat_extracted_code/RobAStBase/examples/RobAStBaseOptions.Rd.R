library(RobAStBase)


### Name: RobAStBaseOptions
### Title: Function to change the global variables of the package
###   'RobAStBase'
### Aliases: RobAStBaseOptions getRobAStBaseOption kStepUseLast
###   modifyICwarn withUpdateInKer IC.UpdateInKer all.verbose withICList
###   withPICList modifyICwarn
### Keywords: misc robust

### ** Examples

RobAStBaseOptions()
RobAStBaseOptions("kStepUseLast")
RobAStBaseOptions("kStepUseLast" = TRUE)
# or
RobAStBaseOptions(kStepUseLast = 1e-6)
getRobAStBaseOption("kStepUseLast")



