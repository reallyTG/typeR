library(ncodeR)


### Name: RegexCode
### Title: RegexCode
### Aliases: RegexCode
### Keywords: datasets

### ** Examples

data(RS.data)
rs = RS.data

# Generate a Code
newcode = RegexCode$new(name = "New Code", definition = "Some definition", 
    excerpts = rs$text, expressions = c("number","data"))




