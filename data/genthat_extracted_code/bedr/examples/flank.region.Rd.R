library(bedr)


### Name: flank.region
### Title: Get adjacent flanks from regions
### Aliases: flank.region
### Keywords: flank

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];
a <- bedr(engine = "bedtools", input = list(i = a), method = "sort", params = "");
b <- flank.region(a, n.add = 20);

}



