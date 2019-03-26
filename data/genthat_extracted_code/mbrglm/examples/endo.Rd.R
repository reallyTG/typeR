library(mbrglm)


### Name: endo
### Title: Endometrial cancer grade
### Aliases: endo
### Keywords: datasets

### ** Examples

data(endo)
glm(HG~NV+PI+EH,family=binomial,data=endo)
mbrglm(HG~NV+PI+EH,family=binomial,data=endo)



