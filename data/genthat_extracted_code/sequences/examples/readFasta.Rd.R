library(sequences)


### Name: readFasta
### Title: Read fasta files.
### Aliases: readFasta
### Keywords: IO, file

### ** Examples

f <- dir(system.file("extdata",package="sequences"),pattern="fasta",full.names=TRUE)
f
aa <- readFasta(f[1])
aa



