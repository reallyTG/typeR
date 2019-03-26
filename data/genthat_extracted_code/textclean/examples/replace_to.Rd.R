library(textclean)


### Name: replace_to
### Title: Grab Begin/End of String to/from Character
### Aliases: replace_to replace_from

### ** Examples

## Not run: 
##D x <- c("a_b_c_d", "1_2_3_4", "<_?_._:")
##D replace_to(x, "_")
##D replace_to(x, "_", 2)
##D replace_to(x, "_", 3)
##D replace_to(x, "_", 4)
##D replace_to(x, "_", 3, include=TRUE)
##D 
##D replace_from(x, "_")
##D replace_from(x, "_", 2)
##D replace_from(x, "_", 3)
##D replace_from(x, "_", 4)
##D replace_from(x, "_", 3, include=TRUE)
##D 
##D x2 <- gsub("_", " ", x)
##D replace_from(x2, " ", 2)
##D replace_to(x2, " ", 2)
##D 
##D x3 <- gsub("_", "\\^", x)
##D replace_from(x3, "^", 2)
##D replace_to(x3, "^", 2)
##D 
##D x4 <- c("_a_b", "a__b")
##D replace_from(x4, "_", 1)
##D replace_to(x4, "_", 1)
## End(Not run)



