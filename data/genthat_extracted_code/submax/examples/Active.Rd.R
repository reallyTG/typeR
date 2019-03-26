library(submax)


### Name: Active
### Title: Physical Activity and Survival in NHANES
### Aliases: Active
### Keywords: datasets

### ** Examples

# The example is from Lee et al. (2017).
data(Active)
submax(Active$delta,Active[,1:7],gamma=1,alternative="less")



