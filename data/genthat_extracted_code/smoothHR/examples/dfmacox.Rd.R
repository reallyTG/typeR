library(smoothHR)


### Name: dfmacox
### Title: Degrees of freedom in multivariate additive Cox models
### Aliases: dfmacox
### Keywords: models regression survival

### ** Examples

# Example 1
library(survival)
data(whas500)
mydf_ns <- dfmacox(time="lenfol", status="fstat", nl.predictors=c("los", "bmi"),
other.predictors=c("age", "hr", "gender", "diasbp"), smoother="ns", data=whas500)
print(mydf_ns)

# Example 2
mydf_ps <- dfmacox(time="lenfol", status="fstat", nl.predictors=c("los", "bmi"),
other.predictors=c("age", "hr", "gender", "diasbp"), smoother="pspline", data=whas500)
print(mydf_ps)



