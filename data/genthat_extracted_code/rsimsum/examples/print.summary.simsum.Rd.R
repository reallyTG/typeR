library(rsimsum)


### Name: print.summary.simsum
### Title: print.summary.simsum
### Aliases: print.summary.simsum

### ** Examples

data("MIsim")
x <- simsum(data = MIsim, estvarname = "b", true = 0.5, se = "se",
            methodvar = "method", mcse = TRUE)
xs <- summary(x)
xs

# Printing only bias and coverage:
print(xs, sstat = c("bias", "cover"))



