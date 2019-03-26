library(pegas)


### Name: write.loci
### Title: Write Allelic Data Files
### Aliases: write.loci
### Keywords: IO

### ** Examples

data(jaguar)
x <- jaguar[1:10, 1:3] # take a small subset
write.loci(x)
## use of '...':
write.loci(x, loci.sep = "\t", quote = FALSE, col.names = FALSE)



