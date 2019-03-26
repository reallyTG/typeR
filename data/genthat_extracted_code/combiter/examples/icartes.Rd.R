library(combiter)


### Name: icartes
### Title: Cartesian Product Iterator
### Aliases: icartes icartesv

### ** Examples

x <- icartes(c(3, 2, 4))
ct <- 0
while (hasNext(x))
{
  ct <- ct + 1
  i <- nextElem(x)
  cat(sprintf("%3d : %s\n", ct, paste0(i, collapse = " ")))
}

x <- icartesv(Month=c("Jan", "Feb", "Mar"),
              Loc=c("NY", "LA"),
              By=c("car", "plane", "bus"))
as.list(x)



