library(bedr)


### Name: grow.region
### Title: Get adjacent flanks from regions
### Aliases: grow.region
### Keywords: sort

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];
a <- bedr(engine = "bedtools", input = list(i = a), method = "sort", params = "");
b <- grow.region(a, n.add = 20);

}



