library(nlme)


### Name: formula.pdBlocked
### Title: Extract pdBlocked Formula
### Aliases: formula.pdBlocked
### Keywords: models

### ** Examples

pd1 <- pdBlocked(list(~ age, ~ Sex - 1))
formula(pd1)
formula(pd1, asList = TRUE)



