library(umx)


### Name: umx_is_class
### Title: Check if variables in a dataframe are in a list of classes.
### Aliases: umx_is_class

### ** Examples

umx_is_class(mtcars) # report class list
# Are the variables in mtcars type character?
umx_is_class(mtcars, "character") # FALSE
# They're all numeric data
umx_is_class(mtcars, "numeric") # TRUE
# Show the test-result for each variable in mtcars
umx_is_class(mtcars, "numeric") # TRUE
# Are they _either_ a char OR a num?
umx_is_class(mtcars, c("character", "numeric"))
# Is zygosity a factor (note we don't drop = F to keep as dataframe)
umx_is_class(twinData[,"zygosity", drop=FALSE], classes = "factor")



