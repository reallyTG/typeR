library(chemCal)


### Name: loq
### Title: Estimate a limit of quantification (LOQ)
### Aliases: loq loq.lm loq.rlm loq.default
### Keywords: manip

### ** Examples

m <- lm(y ~ x, data = massart97ex1)
loq(m)

# We can get better by using replicate measurements
loq(m, n = 3)



