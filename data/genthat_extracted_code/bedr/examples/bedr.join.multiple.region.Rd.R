library(bedr)


### Name: bedr.join.multiple.region
### Title: join multiple region objects
### Aliases: bedr.join.multiple.region
### Keywords: join

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];
b <- index[[2]];

a.sort <- bedr.sort.region(a);
b.sort <- bedr.sort.region(b);
d <- get.random.regions(100, chr="chr1", sort = TRUE);

a.mult <- bedr.join.multiple.region(x = list(a.sort,b.sort,bedr.sort.region(d)));
}



