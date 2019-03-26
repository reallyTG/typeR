library(forwards)


### Name: useR2016
### Title: Data From useR! 2016 Survey
### Aliases: useR2016
### Keywords: datasets

### ** Examples

# cross-tabulate age and length of time using R
xtabs(~ Q3 + Q11, data = useR2016)

# fit a logistic regression with "contribute to or write packages" predicted by
# gender, length of R usage, employment status, and community belonging
response <- with(useR2016,
    ifelse(!is.na(Q13_D) | !is.na(Q13_E) | !is.na(Q13_F), 1, 0))
glm(response ~ Q2 + Q11 + Q8 + Q18, data = useR2016)



