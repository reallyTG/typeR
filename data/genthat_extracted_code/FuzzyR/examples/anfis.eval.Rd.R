library(FuzzyR)


### Name: anfis.eval
### Title: ANFIS evaluator
### Aliases: anfis.eval

### ** Examples

fis <- anfis.tipper()
anfis <- anfis.builder(fis)
data.num <- 5
input.num <- length(fis$input)
input.stack <- matrix(rnorm(data.num*input.num), ncol=input.num)
y <- matrix(rnorm(data.num))
data.trn <- cbind(input.stack, y)
anfis.eval(anfis, input.stack)



