library(easyCODA)


### Name: DUMMY
### Title: Dummy variable (indicator) coding
### Aliases: DUMMY
### Keywords: coding

### ** Examples

# Indicator (dummy) coding of sex in FishMorphology data set
data(fish)
sex   <- fish[,1]
sex.Z <- DUMMY(sex, catnames=c("F","M")) 



