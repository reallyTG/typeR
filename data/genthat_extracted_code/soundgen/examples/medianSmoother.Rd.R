library(soundgen)


### Name: medianSmoother
### Title: Median smoothing
### Aliases: medianSmoother
### Keywords: internal

### ** Examples

df = data.frame(a = rnorm(100, mean = 100, sd = 20),
                b = rnorm(100, mean = 100, sd = 10))
df1 = soundgen:::medianSmoother(df, smoothing_ww = 5, smoothingThres = 1)
plot(df[, 2], type='b')
lines(df1[, 2], type='b', col='blue', pch=3)



