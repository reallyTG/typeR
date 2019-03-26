library(bedr)


### Name: in.region
### Title: checks if regions in object a are found in object b
### Aliases: in.region
### Keywords: in

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];
b <- index[[2]];
a <- bedr(engine = "bedtools", input = list(i = a), method = "sort", params = "");
b <- bedr(engine = "bedtools", input = list(i = b), method = "sort", params = "");

d <- in.region(a,b);

# alternative calling
d <- a %in.region% b

}



