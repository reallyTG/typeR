library(prediction)


### Name: find_data
### Title: Extract data from a model object
### Aliases: find_data find_data.default find_data.data.frame
###   find_data.crch find_data.glimML find_data.glm find_data.hxlr
###   find_data.lm find_data.mca find_data.merMod find_data.svyglm
###   find_data.train find_data.vgam find_data.vglm

### ** Examples

require("datasets")
x <- lm(mpg ~ cyl * hp + wt, data = head(mtcars))
find_data(x)




