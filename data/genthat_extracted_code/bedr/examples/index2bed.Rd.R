library(bedr)


### Name: index2bed
### Title: convert a region index into a bed file dataframe
### Aliases: index2bed
### Keywords: bedtools

### ** Examples

if (check.binary("bedtools")) {

index <- get.example.regions();
a <- index[[1]];
a.bed <- index2bed(a);
}



