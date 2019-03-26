library(safetyGraphics)


### Name: textKeysToList
### Title: Helper function to convert keys from text to nested lists
### Aliases: textKeysToList

### ** Examples

safetyGraphics:::textKeysToList("id_col") 
#list(list("id_col"))

#list(list("id_col"),list("measure_col","label"))
safetyGraphics:::textKeysToList(c("id_col","measure_col--label")) 



