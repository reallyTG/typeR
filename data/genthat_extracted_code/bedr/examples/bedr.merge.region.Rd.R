library(bedr)


### Name: bedr.merge.region
### Title: merge i.e. collapse overlpaping regions
### Aliases: bedr.merge.region
### Keywords: merge

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];

a.sort   <- bedr.sort.region(a);
a.merged <- bedr.merge.region(a.sort);

}



