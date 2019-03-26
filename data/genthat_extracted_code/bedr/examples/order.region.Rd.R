library(bedr)


### Name: order.region
### Title: Gets the sort order of a region index similar to the order
###   command
### Aliases: order.region
### Keywords: order sort

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];
a <- bedr(engine = "bedtools", input = list(i = a), method = "sort", params = "");
a.order <- order.region(a)

b <- a[a.order];

}



