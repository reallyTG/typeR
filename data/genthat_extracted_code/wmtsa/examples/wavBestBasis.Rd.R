library(wmtsa)


### Name: wavBestBasis
### Title: DWPT Best basis selection
### Aliases: wavBestBasis
### Keywords: univar

### ** Examples

## calculate the DWPT of the difference of the 
## atomic clock series 
W <- wavDWPT(diff(atomclock), n.level=6)

## define an entropy cost functional 
"entropy" <- function(x){
    iz <- which(x==0)
    z <- -x^2 * log(x^2)
    if (length(iz))
       z[iz] <- 0
    sum(z)
}

## create the cost vector 
C <- unlist(lapply(W$data, entropy))

## calculate the bets basis 
z <- wavBestBasis(C)

## print the crystals of the best basis 
paste("W(", z$level, ",", z$osc, ")", sep="")



