library(parallelize.dynamic)


### Name: Apply
### Title: Expose an apply-loop to parallelization
### Aliases: Apply Lapply Sapply
### Keywords: programming iteration parallel programming

### ** Examples

	r0 = sapply(1:10, function(x)x^2);
	r1 = Sapply(1:10, function(x)x^2);
	print(all(r0 == r1));



