library(bedr)


### Name: process.input
### Title: process.input
### Aliases: process.input
### Keywords: input

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();
a <- index[[1]];
a <- bedr(engine = "bedtools", input = list(i = a), method = "sort", params = "");
a.processed <- process.input(a, verbose = FALSE)

}



