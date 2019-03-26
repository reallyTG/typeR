library(ncodeR)


### Name: print.summary.CodeSet
### Title: Print the summary of a CodeSet
### Aliases: print.summary.CodeSet

### ** Examples

data(RS.data)
rs = RS.data

newcode = create.code(name = "Data", 
    expressions = c("number","data"), excerpts = rs$text)
code.set = code.set("Demo RS CodeSet", "CodeSet made for the demo", 
    excerpts = rs$text, codes = c(newcode))
summary(code.set)




