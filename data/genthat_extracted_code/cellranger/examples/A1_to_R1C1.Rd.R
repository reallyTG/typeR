library(cellranger)


### Name: A1_to_R1C1
### Title: Convert cell reference strings from A1 to R1C1 format
### Aliases: A1_to_R1C1

### ** Examples

A1_to_R1C1("$A$1")
A1_to_R1C1("A1")                 ## raises a warning, returns NA
A1_to_R1C1("A1", strict = FALSE) ## unless strict = FALSE
A1_to_R1C1(c("A1", "B$4")) ## raises a warning, includes an NA, because
A1_to_R1C1(c("A1", "B$4"), strict = FALSE) ## mixed ref always returns NA



