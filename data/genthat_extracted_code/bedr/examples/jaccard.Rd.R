library(bedr)


### Name: jaccard
### Title: calculate the jaccard distance between sets of intervals
### Aliases: jaccard
### Keywords: distance

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];
b <- index[[2]];
a <- bedr(engine = "bedtools", input = list(i = a), method = "sort", params = "");
b <- bedr(engine = "bedtools", input = list(i = b), method = "sort", params = "");
jaccard(a,b);

}



