library(gtx)


### Name: multimatch
### Title: Match with multiple matching possible.
### Aliases: multimatch

### ** Examples

bmidata <- data.frame(subject = c("A001", "A002", "A003", "A003"),
                      year = c(2001, 2001, 2001, 2005),
                      bmi = c(21.3, 29.7, 25.5, 22.3))
multimatch(c("A002", "A003"), bmidata$subject, bmidata$bmi)



