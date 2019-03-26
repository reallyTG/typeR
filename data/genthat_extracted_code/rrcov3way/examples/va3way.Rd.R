library(rrcov3way)


### Name: va3way
### Title: Manufacturing value added by technology intensity for several
###   years
### Aliases: va3way
### Keywords: datasets

### ** Examples

data(va3way)
ct <- 2
x <- va3way[ct,,]/1000000
plot(colnames(x), x[1,], ylim=c(min(x), max(x)), type="n", ylab="Manufacturing Value 
    Added in million USD", xlab="Years")
for(i in 1:nrow(x))
    lines(colnames(x), x[i,], col=i)
legend("topleft", legend=rownames(x), col=1:nrow(x), lwd=1)
title(paste("Coutnry: ", rownames(va3way[,,1])[ct]))


## Treat quickly and dirty the zeros in the data set (if any) 
## in order to be able to perform ilr transformation:

va3way[va3way==0] <- 0.001

res <- Tucker3(va3way)

##
## Not yet a print function
##
print(res$fit)
print(res$A)

## Print the core matrix
print(res$GA)

## Distance-distance plot
plot(res, which="dd", main="Distance-distance plot")

## Paired component plot, mode A
plot(res, which="comp", main="Paired component plot (mode A)")

## Paired component plot, mode B
plot(res, which="comp", mode="B", main="Paired component plot (mode B)") 

## Joint biplot
plot(res, which="jbplot", main="Joint biplot") 

## Trajectory
plot(res, which="tjplot", main="Trajectory biplot") 




