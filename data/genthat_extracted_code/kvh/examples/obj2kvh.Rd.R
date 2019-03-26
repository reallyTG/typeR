library(kvh)


### Name: obj2kvh
### Title: Writing/Adding an R Object to KVH File.
### Aliases: obj2kvh

### ** Examples

m=matrix(1:6,2,3);
fcn=file("m.kvh", "w");
obj2kvh(m, "m", fcn);
close(fcn);




