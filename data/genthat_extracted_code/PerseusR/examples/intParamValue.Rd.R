library(PerseusR)


### Name: intParamValue
### Title: Int parameter value
### Aliases: intParamValue

### ** Examples

tmp <- tempfile(fileext = ".xml")
write('<IntParam Name="test_int">\n<Value>2</Value>\n</IntParam>', file=tmp)
parameters <- parseParameters(tmp)
intParamValue(parameters, "test_int")



