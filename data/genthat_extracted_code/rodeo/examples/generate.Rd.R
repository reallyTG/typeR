library(rodeo)


### Name: generate
### Title: Code Generator
### Aliases: generate

### ** Examples

data(vars, pars, funs, pros, stoi)
model <- rodeo$new(vars, pars, funs, pros, stoi, dim=c(1))
fortranCode <- model$generate(lang="f95")
## Not run: 
##D write(fortranCode, file="")
## End(Not run)



