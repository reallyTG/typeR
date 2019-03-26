library(bedr)


### Name: is.valid.seq
### Title: verifies that sequences are correct given coordinates and a
###   reference
### Aliases: is.valid.seq
### Keywords: sequence

### ** Examples

if (check.binary("bedtools")) {
  index <- get.example.regions();
  a <- index[[1]];
  a <- get.fasta(bedr.sort.region(a));
  is.valid.seq(x = a, querySeq = a$sequence);
}



