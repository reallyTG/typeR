library(disto)


### Name: `[.disto`
### Title: Extract from a disto object in matrix style extraction
### Aliases: `[.disto` [.disto

### ** Examples

temp <- stats::dist(iris[,1:4])
dio <- disto(objectname = "temp")
dio
names(dio) <- paste0("a", 1:150)

dio[1, 2]
dio[2, 1]
dio[c("a1", "a10"), c("a5", "a72")]
dio[c("a1", "a10"), c("a5", "a72"), product = "inner"]
dio[k = c(1,3,5)]



