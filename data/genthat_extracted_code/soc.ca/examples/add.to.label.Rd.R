library(soc.ca)


### Name: add.to.label
### Title: Add values to label
### Aliases: add.to.label

### ** Examples

example(soc.ca)
result.label  <- add.to.label(result)
result.label$names.mod
result.label  <- add.to.label(result, value = "ctr", dim = 2)
result.label$names.mod
result.label  <- add.to.label(result, value = result$variable, prefix = " - ", suffix = "")
result.label$names.mod
result.label  <- add.to.label(result, value = "linebreak")
result.label$names.mod
map.ctr(result.label)



