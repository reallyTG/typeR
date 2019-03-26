library(ncodeR)


### Name: as.data.frame.CodeSet
### Title: Title
### Aliases: as.data.frame.CodeSet

### ** Examples

data(RS.data)
rs = RS.data
newcode = create.code(name = "Data", expressions = c("number","data"), 
    excerpts = rs$text)
code.set = code.set("Demo RS CodeSet", "CodeSet made for the demo", 
    excerpts = rs$text, codes = c(newcode))
as.data.frame(code.set)




