library(extraTrees)


### Name: prepareForSave
### Title: Prepares ExtraTrees object for save() function
### Aliases: prepareForSave
### Keywords: save,load,extraTrees

### ** Examples

  et <- extraTrees(iris[,1:4], iris$Species)
  prepareForSave(et)
  ## saving to a file
  save(et, file="temp.Rdata")

  ## testing: remove et and load it back from file
  rm(list = "et")
  load("temp.Rdata")
  predict(et, iris[,1:4])



