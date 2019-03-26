library(dlnm)


### Name: equalknots
### Title: Define Knots at Equally-Spaced Values
### Aliases: equalknots
### Keywords: smooth

### ** Examples

### setting 3 knots for range 0-20
equalknots(20, 3)

### setting knots and cut-offs for different functions
equalknots(20, fun="ns", df=4)
equalknots(20, fun="bs", df=4, degree=2)
equalknots(20, fun="strata", df=4)

### with and without without intercept
equalknots(20, fun="ns", df=4)
equalknots(20, fun="ns", df=4, intercept=TRUE)



