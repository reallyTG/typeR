library(combiter)


### Name: iperm
### Title: Permutation Iterator
### Aliases: iperm ipermv

### ** Examples

x <- iperm(3)
ct <- 0
while (hasNext(x))
{
  ct <- ct + 1
  i <- nextElem(x)
  cat(sprintf("%3d : %s\n", ct, paste0(i, collapse = " ")))
}


as.list(ipermv(c("R", "G", "B")))



