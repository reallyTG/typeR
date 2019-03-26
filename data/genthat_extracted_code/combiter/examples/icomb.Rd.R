library(combiter)


### Name: icomb
### Title: Combination Iterator
### Aliases: icomb icombv

### ** Examples

x <- icomb(5, 3)
ct <- 0
while (hasNext(x))
{
  ct <- ct + 1
  i <- nextElem(x)
  cat(sprintf("%3d : %s\n", ct, paste0(i, collapse = " ")))
}

as.list(icombv(c("A", "G", "C"), 2))



