library(scan)


### Name: describeSC
### Title: Descriptive statistics for single-case data
### Aliases: describeSC

### ** Examples

## Descriptive statistics for one single-case
describeSC(Waddell2011)

## Descriptive statistics for a list of three single-cases
describeSC(Grosche2011)

## Write descriptive statistics to .csv-file
study <- describeSC(Waddell2011)
write.csv(study$descriptives, file = "descriptives.csv")



