library(doBy)


### Name: renameCol
### Title: Rename columns in a matrix or a dataframe.
### Aliases: renameCol
### Keywords: utitlities

### ** Examples



renameCol(CO2, 1:2, c("kk", "ll"))
renameCol(CO2, c("Plant", "Type"), c("kk", "ll"))

# These fail - as they should:
# renameCol(CO2, c("Plant", "Type", "conc"), c("kk", "ll"))
# renameCol(CO2, c("Plant", "Type", "Plant"), c("kk", "ll"))




