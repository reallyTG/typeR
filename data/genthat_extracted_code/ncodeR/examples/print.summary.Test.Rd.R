library(ncodeR)


### Name: print.summary.Test
### Title: Print a Test summary
### Aliases: print.summary.Test

### ** Examples

data(RS.data)
rs = RS.data
newcode = create.code( name = "Data", 
    expressions = c("number","data"), excerpts = rs$text)
#newcode = handcode(code = newcode, excerpts = rs$text, n = 4)
newcode = test(code = newcode, kappaThreshold = 0.65)
summary(newcode$statistics)



