library(diseasemapping)


### Name: casedata
### Title: Data set contains the number of cases information
### Aliases: casedata
### Keywords: datasets

### ** Examples

data(casedata)
head(casedata)
table(casedata$cases)
tapply(casedata$cases, casedata$age, sum)

## maybe str(casedata) ; plot(casedata) ...



