library(bedr)


### Name: bedr.join.region
### Title: join two region objects using a left outer join
### Aliases: bedr.join.region
### Keywords: join

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];
b <- index[[2]];

a.sort <- bedr.sort.region(a);
b.sort <- bedr.sort.region(b);

d <- bedr.join.region(a.sort, b.sort);
}



