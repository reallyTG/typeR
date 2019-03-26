library(analogue)


### Name: bootstrap.wa
### Title: Bootstrap estimation and errors for WA models
### Aliases: bootstrap.wa print.bootstrap.wa
### Keywords: multivariate methods

### ** Examples

## Imbrie and Kipp
data(ImbrieKipp)
data(SumSST)
ik.wa <- wa(SumSST ~ ., data = ImbrieKipp, tol.dw = TRUE,
            min.tol = 2, small.tol = "min")
ik.wa

## compare actual tolerances to working values
with(ik.wa, rbind(tolerances, model.tol))

## bootstrap the WA model
ik.boot <- bootstrap(ik.wa, n.boot = 100)

## performance statistics
performance(ik.boot)



