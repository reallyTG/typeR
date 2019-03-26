library(pivmet)


### Name: piv_sel
### Title: Pivotal Selection via Co-Association Matrix
### Aliases: piv_sel

### ** Examples

# Iris data

data(iris)
x<- iris[,1:4]
N <- length(iris[,1])
H <- 1000
a <- matrix(NA, H, N)

# Perform H k-means partitions

for (h in 1:H){
 a[h,] <- kmeans(x, centers = 3)$cluster
}
# Build the co-association matrix

C <- matrix(1, N,N)
for (i in 1:(N-1)){
 for (j in (i+1):N){
   C[i,j] <- sum(a[,i]==a[,j])/H
   C[j,i] <- C[i,j]
 }}

km <- kmeans(x, centers =3)

# Find the pivots according to the three possible pivotal criterion

ris <- piv_sel(C, clusters = km$cluster)

plot(iris[,1], iris[,2], xlab ="Sepal.Length", ylab= "Sepal.Width",
col = km$cluster)

 # Add the pivots according to maxsumdiff criterion

points( x[ris$pivot[,3], c( "Sepal.Length","Sepal.Width" )], col = 1:3,
cex =2, pch = 8 )




