library(rrcov3way)


### Name: elind
### Title: OECD Electronics Industries Data
### Aliases: elind
### Keywords: datasets

### ** Examples

data(elind)

res <- Parafac(elind, robust=FALSE, ilr=FALSE)

## Distance-distance plot
plot(res, which="dd", main="Distance-distance plot")

## Paired component plot, mode A
plot(res, which="comp", main="Paired component plot (mode A)")

## Paired component plot, mode B
plot(res, which="comp", mode="B", main="Paired component plot (mode B)") 

## Per-component plot
plot(res, which="percomp", comp=1, main="Per component plot") 

## all components plot
plot(res, which="allcomp", main="All components plot", legend.position="topright") 




