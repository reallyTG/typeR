library(iotools)


### Name: chunk.apply
### Title: Process input by applying a function to each chunk
### Aliases: chunk.apply chunk.tapply
### Keywords: manip

### ** Examples

## Not run: 
##D ## compute quantiles of the first variable for each chunk
##D ## of at most 10kB size
##D chunk.apply("input.file.txt",
##D             function(o) {
##D               m = mstrsplit(o)
##D               quantile(as.numeric(m[,1]), c(0.25, 0.5, 0.75))
##D             }, CH.MAX.SIZE=1e5)
## End(Not run)



