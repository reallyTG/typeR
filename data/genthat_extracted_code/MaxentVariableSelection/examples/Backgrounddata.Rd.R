library(MaxentVariableSelection)


### Name: Backgrounddata
### Title: CSV file with background/pseudoabsence data
### Aliases: Backgrounddata
### Keywords: datasets

### ** Examples

backgroundlocations <- system.file("extdata",
                                   "Backgrounddata.csv",
                                   package="MaxentVariableSelection")
backgroundlocations <- read.csv(backgroundlocations,header=TRUE)
head(backgroundlocations)



