library(bedr)


### Name: permute.region
### Title: permute a set of regions
### Aliases: permute.region
### Keywords: permute

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();
a <- index[[1]];
a <- bedr(engine = "bedtools", input = list(i = a), method = "sort", params = "");
a.perm <- permute.region(a);

}



