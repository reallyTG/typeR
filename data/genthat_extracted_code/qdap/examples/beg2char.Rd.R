library(qdap)


### Name: beg2char
### Title: Grab Begin/End of String to Character
### Aliases: beg2char char2end

### ** Examples

## Not run: 
##D x <- c("a_b_c_d", "1_2_3_4", "<_?_._:")
##D beg2char(x, "_")
##D beg2char(x, "_", 2)
##D beg2char(x, "_", 3)
##D beg2char(x, "_", 4)
##D beg2char(x, "_", 3, include=TRUE)
##D 
##D char2end(x, "_")
##D char2end(x, "_", 2)
##D char2end(x, "_", 3)
##D char2end(x, "_", 4)
##D char2end(x, "_", 3, include=TRUE)
##D 
##D x2 <- gsub("_", " ", x)
##D char2end(x2, " ", 2)
##D beg2char(x2, " ", 2)
##D 
##D x3 <- gsub("_", "\\^", x)
##D char2end(x3, "^", 2)
##D beg2char(x3, "^", 2)
## End(Not run)



