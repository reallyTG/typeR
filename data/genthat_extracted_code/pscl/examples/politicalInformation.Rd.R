library(pscl)


### Name: politicalInformation
### Title: Interviewer ratings of respondent levels of political
###   information
### Aliases: politicalInformation
### Keywords: datasets

### ** Examples

data(politicalInformation)

table(politicalInformation$y,exclude=NULL)

op <- MASS::polr(y ~ collegeDegree + female + log(age) + homeOwn + govt + log(length),
           data=politicalInformation,
           Hess=TRUE,
           method="probit")



