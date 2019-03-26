library(rfordummies)


### Name: saveElements
### Title: Saves a copy of the periodic table of elements as excel or csv
###   file.
### Aliases: saveElements

### ** Examples

saveElements(file.path(tempdir(), "elements.xlsx"))
saveElements(file.path(tempdir(), "elements.csv"), type = "csv")
list.files(tempdir(), pattern = "xlsx|csv", full.names = TRUE)




