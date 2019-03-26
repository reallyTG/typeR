library(simecol)


### Name: eightneighbours
### Title: Count Number of Neighbours in a Rectangular Cellular Grid.
### Aliases: eightneighbours eightneighbors
### Keywords: array

### ** Examples

n <- 80; m <- 80
x <- matrix(rep(0, m*n), nrow = n)
x[round(runif(1500, 1, m*n))] <- 1
## uncomment this for another figure
#x[40, 20:60] <- 1

image(x, col=c("wheat", "grey", "red"))
x2 <- x
for (i in 2:10){
  nb <- eightneighbours(x)

  ## survive with 2 or 3 neighbours
  xsurv <- ifelse(x > 0 & (nb == 2 | nb ==3), 1, 0)

  ## generate for empty cells with 3 neigbours
  xgen <- ifelse(x == 0 & nb == 3, 1, 0)

  x  <- ((xgen + xsurv)>0)
  x2 <- ifelse(x2>1, 1, x2)
  x2 <- ifelse(x>0, 2, x2)

  image(x2, col=c("wheat", "grey", "red"), add=TRUE)
}



