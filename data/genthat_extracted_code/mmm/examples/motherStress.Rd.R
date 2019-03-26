library(mmm)


### Name: motherStress
### Title: Mother's Stress and Children's Morbidity Study
### Aliases: motherStress
### Keywords: datasets

### ** Examples

data(motherStress)
head(motherStress,10)
require(graphics)
mosaicplot(~motherStress$employed+motherStress$housize+motherStress$stress,color=TRUE)



