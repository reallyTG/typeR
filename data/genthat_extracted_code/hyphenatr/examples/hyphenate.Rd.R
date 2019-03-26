library(hyphenatr)


### Name: hyphenate
### Title: Hyphenate a character vector of words
### Aliases: hyphenate

### ** Examples

dat <- readLines(system.file("extdata/top10000en.txt", package="hyphenatr"))

out1 <- hyphenate(dat)
out2 <- hyphenate(dat, simplify=FALSE)
out3 <- hyphenate(dat, simplify="-")
out4 <- hyphenate(dat, simplify="&shy;")



