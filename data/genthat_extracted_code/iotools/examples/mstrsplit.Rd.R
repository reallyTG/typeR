library(iotools)


### Name: mstrsplit
### Title: Split binary or character input into a matrix
### Aliases: mstrsplit
### Keywords: manip

### ** Examples

  c <- c("A\tB|C|D", "A\tB|B|B", "B\tA|C|E")
  m <- mstrsplit(gsub("\t","|",c))
  dim(m)
  m
  m <- mstrsplit(c,, "\t")
  rownames(m)
  m

  ## use raw vectors instead
  r <- charToRaw(paste(c, collapse="\n"))
  mstrsplit(r)
  mstrsplit(r, nsep="\t")



