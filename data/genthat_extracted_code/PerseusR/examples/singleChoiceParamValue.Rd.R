library(PerseusR)


### Name: singleChoiceParamValue
### Title: Single choice value
### Aliases: singleChoiceParamValue

### ** Examples

tmp <- tempfile(fileext = ".xml")
write('<SingleChoiceParam Name="test_single">\n<Value>1</Value>\n
<Values>\n<Item>A</Item>\n<Item>B</Item>\n</Values>\n</SingleChoiceParam>', file=tmp)
parameters <- parseParameters(tmp)
singleChoiceParamValue(parameters, "test_single")



