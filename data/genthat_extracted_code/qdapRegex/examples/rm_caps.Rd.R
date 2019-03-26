library(qdapRegex)


### Name: rm_caps
### Title: Remove/Replace/Extract All Caps
### Aliases: rm_caps ex_caps
### Keywords: capital caps

### ** Examples

x <- c("UGGG! When I use caps I am YELLING!")
rm_caps(x)
rm_caps(x, replacement="\\L\\1")
ex_caps(x)



