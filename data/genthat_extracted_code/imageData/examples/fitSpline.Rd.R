library(imageData)


### Name: fitSpline
### Title: Produce the fits from a natural cubic smoothing spline applied
###   to a response in a 'data.frame'
### Aliases: fitSpline
### Keywords: data manip

### ** Examples

data(exampleData)
fit <- fitSpline(longi.dat, response="Area", , x="xDays", df = 4,
                 deriv=c(1,2), suffices.deriv=c("AGRdv","Acc"))



