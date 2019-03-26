library(OpasnetUtils)


### Name: result
### Title: Access result vector of an 'ovariable'
### Aliases: result result<-

### ** Examples

a <- Ovariable("a", output = data.frame(Result = 1))
result(a)
result(a) <- 10 * result(a)
a@output



