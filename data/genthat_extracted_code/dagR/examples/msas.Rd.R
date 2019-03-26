library(dagR)


### Name: msas
### Title: Identify minimal sufficient adjustment sets.
### Aliases: msas

### ** Examples

d3<-demo.dag3();
d3s<-dag.search(d3);
msas(d3s$searchRes);
bs<-brute.search(d3);
msas(bs);



