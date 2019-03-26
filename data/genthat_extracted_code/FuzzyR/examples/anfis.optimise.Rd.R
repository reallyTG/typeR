library(FuzzyR)


### Name: anfis.optimise
### Title: ANFIS optimiser
### Aliases: anfis.optimise

### ** Examples

fis <- anfis.tipper()
anfis <- anfis.builder(fis)
data.num <- 5
input.num <- length(fis$input)
input.stack <- matrix(rnorm(data.num*input.num), ncol=input.num)
y <- matrix(rnorm(data.num))
data.trn <- cbind(input.stack, y)
anfis.eval(anfis, input.stack)
anfis.final <- anfis.optimise(anfis, data.trn, epoch.total=500,
                                 stepsize=0.01, rate.inc=1.1, rate.dec=0.9)



