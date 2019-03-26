library(secr)


### Name: esa.plot
### Title: Mask Buffer Diagnostic Plot
### Aliases: esa.plot
### Keywords: hplot

### ** Examples


## with previously fitted model
esa.plot(secrdemo.0)

## from scratch
trps <- make.grid()
msk <- make.mask(trps, buffer = 200, spacing = 5, type = "trapbuffer")
detectpar <- list(g0 = 0.2, sigma = 25)
esa.plot(trps,,, msk, 0, detectpar, nocc = 10, col = "blue")
esa.plot(trps,,, msk, 0, detectpar, nocc = 5, col = "green",
    add = TRUE)

esa.plot(trps,,, msk, 0, detectpar, nocc = 5, thin = 0.002, plt = FALSE)




