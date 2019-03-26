library(OpasnetUtils)


### Name: oapply
### Title: Apply for ovariables
### Aliases: oapply ooapply

### ** Examples

a <- new("ovariable", name = "a", output = data.frame(A = c("a", "a", "b", "b"), 
    B = c("1", "2", "1", "2"), aResult = 1:4), marginal = c(TRUE, TRUE, FALSE))
oapply(a, FUN = sum, cols = "A")
oapply(a, a@output[c("A")], sum)



