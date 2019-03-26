library(archiDART)


### Name: dartToTable
### Title: Import DART Files Into a Single Data Frame
### Aliases: dartToTable

### ** Examples

## Locate folder with DART files
path <- system.file("extdata", package="archiDART")

table<-dartToTable(inputrac=path, inputlie=path, inputtps=path, res=75, unitlength="cm")


