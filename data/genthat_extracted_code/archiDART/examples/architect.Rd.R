library(archiDART)


### Name: architect
### Title: Computing Traits Describing The Global Root System Architecture
### Aliases: architect

### ** Examples

## Locate folder with DART and RSML files
path <- system.file("extdata", package="archiDART")

## Compute RSA parameters for DART and RSML files
res2a <- architect(inputrac=path, inputtps=path, inputrsml=path, res=75, unitlength="cm",
rsml.connect=TRUE, rsml.date="age")

tablersml<-rsmlToTable(inputrsml=path, unitlength="cm", rsml.date="age", rsml.connect=TRUE)
res2b <- architect(inputrsml=tablersml, fitter=TRUE)



