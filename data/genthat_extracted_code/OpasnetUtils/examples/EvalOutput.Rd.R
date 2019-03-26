library(OpasnetUtils)


### Name: EvalOutput
### Title: Evaluate ovariable output
### Aliases: EvalOutput

### ** Examples

a <- Ovariable("a", data.frame(A = c("a", "b"), Result = c("1-2", "1-4")))
a <- EvalOutput(a, N = 10)
a@output



