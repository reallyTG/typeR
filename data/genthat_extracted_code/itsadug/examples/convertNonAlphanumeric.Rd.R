library(itsadug)


### Name: convertNonAlphanumeric
### Title: Prepare string for regular expressions (backslash for all
###   non-letter and non-digit characters)
### Aliases: convertNonAlphanumeric

### ** Examples

data(simdat)
# Model for illustrating coefficients:
m0 <- bam(Y ~ s(Time) + s(Subject, bs='re') 
+ s(Time, Subject, bs='re'), data=simdat)

# get all coefficients:
coef(m0)
# to get only the Subject intercepts:
coef(m0)[grepl(convertNonAlphanumeric("s(Subject)"), names(coef(m0)))]
# to get only the Subject slopes:
coef(m0)[grepl(convertNonAlphanumeric("s(Time,Subject)"), names(coef(m0)))]




