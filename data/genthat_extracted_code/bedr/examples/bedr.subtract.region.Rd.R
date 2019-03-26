library(bedr)


### Name: bedr.subtract.region
### Title: subtracts features or ranges in object b from object a
### Aliases: bedr.subtract.region
### Keywords: subtract

### ** Examples

if (check.binary("bedtools")) {
index <- get.example.regions();

a <- index[[1]];
b <- index[[2]];
a <- bedr(engine = "bedtools", input = list(i = a), method = "sort", params = "");
b <- bedr(engine = "bedtools", input = list(i = b), method = "sort", params = "");
d <- bedr.subtract.region(a,b);
}



