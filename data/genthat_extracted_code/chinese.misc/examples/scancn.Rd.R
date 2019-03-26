library(chinese.misc)


### Name: scancn
### Title: Read a Text File by Auto-Detecting Encoding
### Aliases: scancn

### ** Examples

# No Chinese is allowed, so try an English file
x <- file.path(find.package("base"), "CITATION")
scancn(x)



