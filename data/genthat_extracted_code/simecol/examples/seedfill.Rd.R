library(simecol)


### Name: seedfill
### Title: Color Fill Algorithm
### Aliases: seedfill
### Keywords: array

### ** Examples

# define a matrix
z<-matrix(0, nrow=20, ncol=20)

# draw some lines
z[10,]<-z[,10] <- 1
z[5,] <-z[,5]  <- 3

# plot matrix and filled variants
par(mfrow=c(2, 2))
image(z)
image(seedfill(z))
image(seedfill(z ,x=15, y=15, fcol=1, bcol=3))
image(seedfill(z, x=7, y=7, fcol=3, bcol=1))



