library(rsimsum)


### Name: dropbig.simsum
### Title: Return observations dropped by simsum
### Aliases: dropbig.simsum

### ** Examples

data("MIsim")
x <- simsum(data = MIsim, estvarname = "b", true = 0.5, se = "se",
            methodvar = "method", mcse = TRUE,
dropbig = TRUE, max = 3, semax = 1.5)
d <- dropbig(x)
d



