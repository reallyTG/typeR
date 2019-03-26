library(bsearchtools)


### Name: rowfilters.DFI
### Title: Functions for row filters creation in 'DFI.subset'.
### Aliases: EQ RG IN EQNA NOT AND OR print.DFI.FEXPR toString.DFI.FEXPR
###   as.character.DFI.FEXPR

### ** Examples


# create the following filter: 18 <= Age <= 55 & Married == TRUE
filter <- AND(RG('Age',18,55),EQ('Married',TRUE))

# create the following filter: Age == 25 | Married == TRUE | Name == 'John'
filter <- OR(EQ('Age',25),EQ('Married',TRUE),EQ('Name','John'))




