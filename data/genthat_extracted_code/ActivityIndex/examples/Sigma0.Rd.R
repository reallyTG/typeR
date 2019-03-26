library(ActivityIndex)


### Name: Sigma0
### Title: \bar{sigma}_i computing using raw accelerometry data
### Aliases: Sigma0

### ** Examples

filename = system.file("extdata","sample_GT3X+.csv.gz",package="ActivityIndex")
res = ReadGT3XPlus(filename)
hertz = res$Hertz
x = res$Raw[ 1:1000, c("Time", "X", "Y", "Z")]
res = Sigma0(x, hertz = hertz)
testthat::expect_true(res ==  0.1843216371355338723)



