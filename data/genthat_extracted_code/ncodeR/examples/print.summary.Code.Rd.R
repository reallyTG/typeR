library(ncodeR)


### Name: print.summary.Code
### Title: Print a Code summary
### Aliases: print.summary.Code

### ** Examples

data(RS.data)
rs = RS.data
newcode = create.code(name = "Data", 
    expressions = c("number","data"), excerpts = rs$text)
summary(newcode)




