library(diseasemapping)


### Name: formatCases
### Title: Format the disease case data set
### Aliases: formatCases

### ** Examples

data('casedata')
data('popdata')
head(casedata)
caseformat <- formatCases(casedata, ageBreaks = getBreaks(names(popdata@data)))
head(caseformat)
caseformatagg <- formatCases(casedata, ageBreaks = getBreaks(names(popdata@data)), 
  aggregate.by=c("age", "sex"))
head(caseformatagg)




