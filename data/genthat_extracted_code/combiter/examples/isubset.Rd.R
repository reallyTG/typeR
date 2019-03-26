library(combiter)


### Name: isubset
### Title: Subset Iterator
### Aliases: isubset isubsetv

### ** Examples

x <- isubset(3)
ct <- 0
while (hasNext(x))
{
  ct <- ct + 1
  i <- nextElem(x)
  cat(sprintf("%3d : %s\n", ct, paste0(i, collapse = " ")))
}

as.list(isubsetv(letters[1:4]))



