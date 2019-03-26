library(re2r)


### Name: sub_string
### Title: Extract and replace substrings from a character vector.
### Aliases: sub_string sub_string<-

### ** Examples

sub_string("test", 1, 2)

x <- "ABC"

(sub_string(x, 1, 1) <- "A")
x
(sub_string(x, -2, -2) <- "GHIJ")
x
(sub_string(x, 2, -2) <- "")
x



