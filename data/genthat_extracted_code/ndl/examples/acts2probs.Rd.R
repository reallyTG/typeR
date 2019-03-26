library(ndl)


### Name: acts2probs
### Title: Calculate probability matrix from activation matrix, as well as
###   predicted values
### Aliases: acts2probs
### Keywords: discriminative learning

### ** Examples

data(think)
think.ndl <- ndlClassify(Lexeme ~ Person + Number + Agent + Register, data=think)
pdata <- acts2probs(think.ndl$activationMatrix)



