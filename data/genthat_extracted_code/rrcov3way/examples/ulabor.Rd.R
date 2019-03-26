library(rrcov3way)


### Name: ulabor
### Title: Undeclared labor by region in Italy
### Aliases: ulabor
### Keywords: datasets

### ** Examples


data(ulabor)
dim(ulabor)
str(ulabor)

## Plot robust and non-robust DD-plots of the ilr-transformed data
usr <- par(mfrow=c(1,2))
res1 <- Parafac(ulabor, robust=TRUE, ilr=TRUE)
res2 <- Parafac(ulabor, ilr=TRUE)
plot(res1)
plot(res2)
par(usr)

## Plot Orthonormalized A-mode component plot
res <- Parafac(ulabor, robust=TRUE, ilr=TRUE)
plot(res, which="comp", mode="A", main="Component plot, A-mode")

## Plot Orthonormalized B-mode component plot
plot(res, which="comp", mode="B", main="Component plot, B-mode")

## Plot Orthonormalized B-mode component plot
plot(res, which="comp", mode="C", main="Component plot, C-mode")


## Per component plot
## adapted for the example and only for robust, ilr transformed model
##
##
res <- Parafac(ulabor, robust=TRUE, ilr=TRUE)

plot(res, which="percomp")              # component 1
plot(res, which="percomp", comp=2)      # component 2




