library(EasyMx)


### Name: emxGrowthModel
### Title: Create a latent growth curve model
### Aliases: emxGrowthModel emxModelGrowth

### ** Examples

   
# Example
require(EasyMx)
data(myLongitudinalData)
mod <- emxGrowthModel('Linear', data=myLongitudinalData, use=names(myLongitudinalData), run=TRUE)




