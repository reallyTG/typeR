library(semTools)


### Name: measurementInvariance-deprecated
### Title: Measurement Invariance Tests
### Aliases: measurementInvariance-deprecated
### Keywords: internal

### ** Examples


HW.model <- ' visual =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed =~ x7 + x8 + x9 '

measurementInvariance(model = HW.model, data = HolzingerSwineford1939,
                      group = "school", fit.measures = c("cfi","aic"))




