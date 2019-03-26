library(ncodeR)


### Name: summary.Code
### Title: Obtain summary of a Code object
### Aliases: summary.Code

### ** Examples

data(RS.data)
rs = RS.data
newcode = create.code(name = "Data", 
    expressions = c("number","data"), excerpts = rs$text)
summary(newcode)




