library(MaxentVariableSelection)


### Name: Occurrencedata
### Title: CSV file with occurrence data
### Aliases: Occurrencedata
### Keywords: datasets

### ** Examples

occurrencelocations <- system.file("extdata",
                                   "Occurrencedata.csv",
                                   package="MaxentVariableSelection")
occurrencelocations <- read.csv(occurrencelocations,header=TRUE)
head(occurrencelocations)



