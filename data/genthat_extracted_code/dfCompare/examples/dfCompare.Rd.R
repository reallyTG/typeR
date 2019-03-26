library(dfCompare)


### Name: dfCompare
### Title: Generate Delta Records
### Aliases: dfCompare

### ** Examples

  a <- c(2, 3, 5)
  b <- c("aa", "bb", "cc")
  c <- c(TRUE, FALSE, TRUE)
  dfOld <- data.frame(a,b,c)

  a <- c(3,4,5)
  b <- c("aaa","dd","cc")
  c <- c(TRUE, FALSE, TRUE)
  dfNew <- data.frame(a,b,c)

  dfDelta <- dfCompare(dfOld,dfNew,"a")



