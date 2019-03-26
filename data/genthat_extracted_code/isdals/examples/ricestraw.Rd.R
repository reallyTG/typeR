library(isdals)


### Name: ricestraw
### Title: Weight increase for cattle fed with rice straw
### Aliases: ricestraw
### Keywords: datasets

### ** Examples

data(ricestraw)
plot(ricestraw$time, ricestraw$weight)
lm(weight ~ time, data=ricestraw)



