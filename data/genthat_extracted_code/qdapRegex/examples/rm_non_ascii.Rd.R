library(qdapRegex)


### Name: rm_non_ascii
### Title: Remove/Replace/Extract Non-ASCII
### Aliases: rm_non_ascii ex_non_ascii
### Keywords: ascii unicode

### ** Examples

x <- c("Hello World", "Ekstr\xf8m", "J\xf6reskog", "bi\xdfchen Z\xfcrcher")
Encoding(x) <- "latin1"
x

rm_non_ascii(x)
rm_non_ascii(x, replacement="<<FLAG>>")
ex_non_ascii(x)
ex_non_ascii(x, ascii.out=FALSE)

## simple regex to remove non-ascii
rm_default(x, pattern="[^ -~]")
ex_default(x, pattern="[^ -~]")



