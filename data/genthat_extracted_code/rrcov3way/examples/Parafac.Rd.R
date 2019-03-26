library(rrcov3way)


### Name: Parafac
### Title: Robust Parafac estimator for compositional data
### Aliases: Parafac print.parafac
### Keywords: Multivariate Robust

### ** Examples

#############
##
## Example with the UNIDO Manufacturing value added data

data(va3way)
dim(va3way)

## Treat quickly and dirty the zeros in the data set (if any) 
va3way[va3way==0] <- 0.001

## 
res <- Parafac(va3way)
res
print(res$fit)
print(res$A)

## Distance-distance plot
plot(res, which="dd", main="Distance-distance plot")

data(ulabor)
res <- Parafac(ulabor, robust=TRUE, ilr=TRUE)
res

## Plot Orthonormalized A-mode component plot
plot(res, which="comp", mode="A", main="Component plot, A-mode")

## Plot Orthonormalized B-mode component plot
plot(res, which="comp", mode="B", main="Component plot, B-mode")

## Plot Orthonormalized B-mode component plot
plot(res, which="comp", mode="C", main="Component plot, C-mode")





