library(rsimsum)


### Name: print.simsum
### Title: print.simsum
### Aliases: print.simsum

### ** Examples

data("MIsim")
x <- simsum(data = MIsim, estvarname = "b", true = 0.5, se = "se",
            methodvar = "method", mcse = TRUE)
x



