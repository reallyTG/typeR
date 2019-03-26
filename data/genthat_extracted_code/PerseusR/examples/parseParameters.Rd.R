library(PerseusR)


### Name: parseParameters
### Title: Parse parameters
### Aliases: parseParameters

### ** Examples

tmp <- tempfile(fileext = ".xml")
write('<IntParam Name="test_int">\n<Value>2</Value>\n</IntParam>', file=tmp)
parameters <- parseParameters(tmp)



