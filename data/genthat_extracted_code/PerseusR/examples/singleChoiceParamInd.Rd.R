library(PerseusR)


### Name: singleChoiceParamInd
### Title: Single choice index
### Aliases: singleChoiceParamInd

### ** Examples

tmp <- tempfile(fileext = ".xml")
write('<SingleChoiceParam Name="test_single">\n<Value>1</Value>\n
<Values>\n<Item>A</Item>\n<Item>B</Item>\n</Values>\n</SingleChoiceParam>', file=tmp)
parameters <- parseParameters(tmp)
singleChoiceParamInd(parameters, "test_single")



