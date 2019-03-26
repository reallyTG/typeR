library(FuzzyR)


### Name: anfis.plotmf
### Title: Plot membership functions for an ANFIS object
### Aliases: anfis.plotmf

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
anfis.plotmf(anfis, 'input', 1)
anfis.plotmf(anfis.final, 'input', 1)



