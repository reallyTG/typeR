library(ncodeR)


### Name: as.data.frame.Code
### Title: Title
### Aliases: as.data.frame.Code

### ** Examples

data(RS.data)
rs = RS.data
newcode = create.code(name = "Data", expressions = c("number","data"), excerpts = rs$text)
as.data.frame(newcode)




