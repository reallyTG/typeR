library(archiDART)


### Name: rsmlToTable
### Title: Import RSML Files Into a Single Data Frame
### Aliases: rsmlToTable

### ** Examples

## Locate folder with RSML file
path <- system.file("extdata", package="archiDART")

table<-rsmlToTable(inputrsml=path, unitlength="cm", rsml.date="age")


