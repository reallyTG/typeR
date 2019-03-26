library(otuSummary)


### Name: typeConvert
### Title: Transpose the data frame if there is data type conversion.
### Aliases: typeConvert
### Keywords: convert

### ** Examples

data(otu4type)
sapply(otu4type, class)
new <- typeConvert(as.data.frame(t(otu4type)), taxhead = "taxonomy")
sapply(new, class)



