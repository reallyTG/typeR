library(BBmisc)


### Name: load2
### Title: Load RData file and return objects in it.
### Aliases: load2

### ** Examples

fn = tempfile()
save2(file = fn, a = 1, b = 2, c = 3)
load2(fn, parts = "a")
load2(fn, parts = c("a", "c"))



