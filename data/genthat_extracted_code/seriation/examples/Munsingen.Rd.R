library(seriation)


### Name: Munsingen
### Title: Hodson's Munsingen Data Set
### Aliases: Munsingen
### Keywords: datasets

### ** Examples

data("Munsingen")

## Seriation method after Kendall (1971)
## Kendall's square symmetric matrix S and SoS
S <- function(x, w = 1) {
  sij <- function(i , j) w * sum(pmin(x[i,], x[j,]))
  h <- nrow(x)
  r <- matrix(ncol = h, nrow =h)
  for(i in 1:h) for (j in 1:h)  r[i,j] <- sij(i,j)
  r
}

SoS <- function(x) S(S(x))

## Kendall's horse shoe (Hamiltonian arc)
horse_shoe_plot <- function(mds, sigma, threshold = mean(sigma), ...) {
    plot(mds, main = paste("Kendall's horse shoe with th =", threshold), ...)  
    l <- which(sigma > threshold, arr.ind=TRUE)
    for(i in 1:nrow(l))  lines(rbind(mds[l[i,1],], mds[l[i,2],])) 
}

## shuffle data
x <- Munsingen[sample(nrow(Munsingen)),]

## calculate matrix and do isoMDS (from package MASS)
sigma <- SoS(x)
library("MASS")
mds <- isoMDS(1/(1+sigma))$points

## plot Kendall's horse shoe
horse_shoe_plot(mds, sigma)

## find order using a TSP 
library("TSP")
tour <- solve_TSP(insert_dummy(TSP(dist(mds)), label = "cut"),
    method = "2-opt", control = list(rep = 15))
tour <- cut_tour(tour, "cut")
lines(mds[tour,], col = "red", lwd = 2)

## create and plot order
order <- ser_permutation(tour, 1:ncol(x))
bertinplot(x, order, options= list(panel=panel.circles,
    rev = TRUE))

## compare criterion values    
rbind(
    random = criterion(x),
    reordered = criterion(x, order),
    Hodson = criterion(Munsingen)
   )



