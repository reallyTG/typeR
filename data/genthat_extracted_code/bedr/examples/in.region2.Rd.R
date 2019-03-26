library(bedr)


### Name: %in.region%
### Title: checks if regions in object a are found in object b
### Aliases: %in.region%
### Keywords: in

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];
b <- index[[2]];
a <- bedr.sort.region(a);
b <- bedr.sort.region(b);

d <- a %in.region% b

}



