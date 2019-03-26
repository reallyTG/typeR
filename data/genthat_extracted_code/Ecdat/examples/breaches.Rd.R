library(Ecdat)


### Name: breaches
### Title: Cyber Security Breaches
### Aliases: breaches
### Keywords: datasets

### ** Examples

data(breaches)
quantile(breaches$Individuals_Affected)
# confirm that the smallest number is 500 
# -- and the largest is 4.9e6
# ... and there are no NAs

dDays <- with(breaches, breach_end - breach_start)
quantile(dDays, na.rm=TRUE)
# confirm that breach_end is NA or is later than 
# breach_start 



