library(bedr)


### Name: size.region
### Title: Get region size
### Aliases: size.region
### Keywords: region

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];

a.sizes <- bedr:::size.region(a);
}



