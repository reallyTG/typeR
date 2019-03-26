library(iotools)


### Name: dstrsplit
### Title: Split binary or character input into a dataframe
### Aliases: dstrsplit rowindex
### Keywords: manip

### ** Examples

input = c("apple\t2|2.7|horse|0d|1|2015-02-05 20:22:57",
          "pear\t7|3e3|bear|e4|1+3i|2015-02-05",
          "pear\te|1.8|bat|77|4.2i|2001-02-05")
z = dstrsplit(x = input,
      col_types = c("integer", "numeric", "character","raw","complex","POSIXct"),
      sep="|", nsep="\t")
lapply(z,class)
z

# Ignoring the third column:
z = dstrsplit(x = input,
      col_types = c("integer", "numeric", "character","raw","complex","POSIXct"),
      sep="|", nsep="\t")
z



