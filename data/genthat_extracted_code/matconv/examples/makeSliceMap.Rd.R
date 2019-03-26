library(matconv)


### Name: makeSliceMap
### Title: Make the maps for converting slice notation
### Aliases: makeSliceMap

### ** Examples

  sliceMap <- makeSliceMap("{", "}", "list")
  sliceMap("junk <- importData{300}")
  # "junk <- importData[[300]]"
  
  sliceMap <- makeSliceMap(matClass = "structure", rClass = "list")
  sliceMap("junk <- students.AP.GPA")
  # junk <- students[['AP']][['GPA']]



