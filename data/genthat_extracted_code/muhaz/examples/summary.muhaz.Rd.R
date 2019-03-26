library(muhaz)


### Name: summary.muhaz
### Title: Display the most important input parameters used in calling the
###   'muhaz' function.
### Aliases: summary.muhaz
### Keywords: survival

### ** Examples

data(ovarian, package="survival")
attach(ovarian)
fit <- muhaz(futime, fustat)
summary(fit)



