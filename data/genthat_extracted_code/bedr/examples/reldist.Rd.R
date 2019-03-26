library(bedr)


### Name: reldist
### Title: Calculate the relative distance between two sets of intervals
### Aliases: reldist
### Keywords: distance

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];
b <- index[[2]];
a <- bedr(engine = "bedtools", input = list(i = a), method = "sort", params = "");
b <- bedr(engine = "bedtools", input = list(i = b), method = "sort", params = "");
reldist(a,b);

}



