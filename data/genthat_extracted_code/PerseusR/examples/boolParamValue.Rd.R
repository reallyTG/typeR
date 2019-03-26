library(PerseusR)


### Name: boolParamValue
### Title: Bool parameter value
### Aliases: boolParamValue

### ** Examples

tmp <- tempfile(fileext = ".xml")
write('<BoolParam Name="test_bool">\n<Value>false</Value>\n</BoolParam>', file=tmp)
parameters <- parseParameters(tmp)
boolParamValue(parameters, "test_bool")



