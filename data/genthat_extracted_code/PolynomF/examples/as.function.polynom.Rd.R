library(PolynomF)


### Name: as.function.polynom
### Title: Coerce polynom or polylist objects to function.
### Aliases: as.function.polynom as.function.polylist
### Keywords: symbolmath

### ** Examples

x <- polynom()
H <- polylist(polynom(1), x)
for(j in 2:5)
    H[[j+1]] <- x*H[[j]] - (j-1)*H[[j-1]]
H5 <- as.function(H)
H5(-4:4)
H5(x+1)



