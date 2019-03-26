library(BaBooN)


### Name: dmi
### Title: Data monotonicity index for missing values
### Aliases: dmi
### Keywords: monotone data pattern

### ** Examples


if(!require(MASS)) install.packages("MASS")
library(MASS)  ## see references
data(survey)

## Sorting via 'norm's prelim.norm
if(!require(Hmisc)) install.packages("Hmisc")
library(Hmisc) ## see references
survey.numeric <- asNumericMatrix(survey)

if(!require(norm)) install.packages("norm")
library(norm) ## see references
su.sort    <- prelim.norm(survey.numeric)
new.survey <- survey[order(su.sort$ro),
                     sort(su.sort$nmis,index.return=TRUE)$ix]

## Comparison
dmi(survey)     # original
dmi(new.survey) # sorted





