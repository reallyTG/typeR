library(UsingR)


### Name: alaska.pipeline
### Title: Comparison of in-field and laboratory measurement of defects
### Aliases: alaska.pipeline
### Keywords: datasets

### ** Examples

data(alaska.pipeline)
res = lm(lab.defect ~ field.defect, alaska.pipeline)
plot(lab.defect ~ field.defect, alaska.pipeline)
abline(res)
plot(fitted(res),resid(res))



