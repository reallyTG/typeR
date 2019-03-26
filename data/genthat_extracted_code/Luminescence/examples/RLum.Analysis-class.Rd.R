library(Luminescence)


### Name: RLum.Analysis-class
### Title: Class '"RLum.Analysis"'
### Aliases: RLum.Analysis-class show,RLum.Analysis-method
###   set_RLum,RLum.Analysis-method get_RLum,RLum.Analysis-method
###   structure_RLum,RLum.Analysis-method length_RLum,RLum.Analysis-method
###   names_RLum,RLum.Analysis-method smooth_RLum,RLum.Analysis-method
### Keywords: classes internal methods

### ** Examples


showClass("RLum.Analysis")

##set empty object
set_RLum(class = "RLum.Analysis")

###use example data
##load data
data(ExampleData.RLum.Analysis, envir = environment())

##show curves in object
get_RLum(IRSAR.RF.Data)

##show only the first object, but by keeping the object
get_RLum(IRSAR.RF.Data, record.id = 1, drop = FALSE)




