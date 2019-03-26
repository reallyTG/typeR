library(csv)


### Name: as.csv
### Title: Read or Write CSV Using Selected Conventions
### Aliases: as.csv

### ** Examples

data <- head(Theoph)
filepath <- file.path(tempdir(),'theoph.csv')
as.csv(data,filepath)
as.csv(filepath)



