library(rNOMADS)


### Name: SanitizeURL
### Title: Remove illegal URL characters
### Aliases: SanitizeURL
### Keywords: internal

### ** Examples


bad.strs <- c("I am full of ^ill=/\\egal characters")
good.str <- SanitizeURL(bad.strs)
print(good.str[1])



