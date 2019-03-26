library(bedr)


### Name: cluster.region
### Title: cluster intervals
### Aliases: cluster.region
### Keywords: cluster merge

### ** Examples


if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];

b <- cluster.region(a, distance = 0);
d <- cluster.region(a, distance = 100);

}



